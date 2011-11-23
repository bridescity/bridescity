class DiscussionsController < ApplicationController

  before_filter :authenticate_user!, :except => :index

  respond_to :html

  def index
    @discussions = Discussion.find(:all)
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(params[:discussion])
    @discussion.author = current_user
    unless @discussion.save
      render :action => :new
    else
      redirect_to @discussion
    end
  end

  def show
    @discussion = @commentable = Discussion.find(params[:id])
    @comment = @discussion.comments.new
    @comments = @discussion.comments.scoped.arrange(:order => :created_at)
  end

  def destroy
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def update
    @discussion = Discussion.find(params[:id])
    if @discussion
      if @discussion.update_attributes(params[:discussion])
        redirect_to @discussion
      else
        render :action => :edit
      end
    end
  end

end

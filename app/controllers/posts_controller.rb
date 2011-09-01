class PostsController < ApplicationController

  respond_to :html

  def index
    @posts = Post.find(:all)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    unless @post.save
      render :action => :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  def update
  end

end

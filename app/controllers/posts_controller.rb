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
    @post.author = current_user
    unless @post.save
      render :action => :new
    else
      redirect_to @post
    end
  end

  def show
    @post = @commentable = Post.find(params[:id])
    @comment = @post.comments.new
    @comments = @post.comments.scoped.arrange(:order => :created_at)
  end

  def destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post
      if @post.update_attributes(params[:post])
        redirect_to @post
      else
        render :action => :edit
      end
    end
  end

end

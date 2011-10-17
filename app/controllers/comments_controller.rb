class CommentsController < ApplicationController

  def new
    @comment = Comment.new(:parent_id => params[:parent_id])
    @commentable = find_commentable
  end

  def create
    #TODO: move to anchor after redirect
    @commentable = params[:comment][:commentable_type].classify.constantize.find(params[:comment][:commentable_id])
    @comment = @commentable.comments.new(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html{render(@comment)}
      else
        format.html{
          #TODO: error handler
        }
      end
    end
  end
end

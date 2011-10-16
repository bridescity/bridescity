class CommentsController < ApplicationController

  def new
    @comment = Comment.new(:parent_id => params[:parent_id])
    @commentable = find_commentable
  end

  def create
    #TODO: move to anchor after redirect
    @commentable = find_commentable
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

  private

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/ && name != "parent_id"
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

end

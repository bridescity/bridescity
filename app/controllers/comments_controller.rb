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
    if @comment.save
      redirect_to @commentable, :anchor => "#comment_#{@comment.id}"
    else
      redirect_to @commentable, :anchor => "#comment_#{@comment.id}"
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

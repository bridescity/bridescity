class UsersController < ApplicationController

  def show
    @user = @commentable = params[:id] ? User.find(params[:id]) : current_user
    @comment = @user.wall_comments.new
    @comments = @user.wall_comments.scoped.arrange(:order => :created_at)

    @friendship = !current_user.nil? && Friendship.friends?(current_user, @user)

    respond_to do |format|
      format.html { render "users/#{@user.type.downcase.pluralize}/show" }
    end
  end

  def edit
    @user = params[:id] ? User.find(params[:id]) : current_user
    respond_to do |format|
      format.html { render "users/#{@user.type.downcase.pluralize}/edit" }
    end
  end

  def update
  end
end
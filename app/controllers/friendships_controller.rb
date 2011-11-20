class FriendshipsController < ApplicationController
  def create
    @user = current_user
    @friend = User.find(params[:id])

    if(@user && @friend)
      Friendship.make_friends(@user, @friendship)
    end
  end

  def destroy
    @f = Friendship.find(params[:id])

    Friendship.stop_being_friends @f.inviter, @f.invited
    respond_to do |format|
    format.html redirect_to current_user
    end
  end
end

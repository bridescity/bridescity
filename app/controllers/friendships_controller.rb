class FriendshipsController < ApplicationController
  def create
    @user = current_user
    @friend = User.find(params[:id])

    Friendship.make_friends(@user, @friend)
    render :json => {:success => true}
  end

  def destroy
    @f = Friendship.find(params[:id])

    Friendship.stop_being_friends @f.inviter, @f.invited

    respond_to do |format|
      format.html redirect_to current_user
    end
  end
end

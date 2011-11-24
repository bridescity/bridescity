class MessagesController < ApplicationController
  def index
    @user = current_user

    if(params[:type] === "sent")
      @unread_messages = @user.sent_messages
    elsif(params[:type] === "inbox")
      @unread_messages = @user.unread_messages
      @read_messages = @user.read_messages
    end

    @to_list = @user.friends

    respond_to do |format|
      format.html {}
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    #добавить проверку на право отправлять сообщение этому пользователю
    @user = User.find(params[:user_id])
    @message = Message.new(:receiver => @user)
  end

  def create
    #добавить проверку на право отправлять сообщение этому пользователю
    @receiver = User.find(params[:message][:receiver_id])

    @message = Message.new(params[:message])
    @message.sender = current_user

    respond_to do |format|
      if @message.save()
        format.html {}
      else
        format.html {}
      end
    end
  end
end

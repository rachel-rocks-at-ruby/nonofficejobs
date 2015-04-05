class MessagesController < ApplicationController
	# GET /message/new
  def new
    unless params[:user]
      redirect_to root_path, notice: 'no'
    else
      @user = User.find(params[:user])
      @message = current_user.messages.new
    end

  end
 
  # POST /message/create
  def create
    @recipient = User.find(params[:user])
    current_user.send_message(@recipient, params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end
end

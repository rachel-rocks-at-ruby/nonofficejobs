class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :mailbox, :conversation
  def index
    @conversations ||= current_user.mailbox.inbox.all
  end

  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation
  end

  def trashbin     
    @trash ||= current_user.mailbox.trash.all   
  end
end
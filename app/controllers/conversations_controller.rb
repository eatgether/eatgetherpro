class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def chatroom
    @poster_user = User.find_by_id(params[:sender_id])
    @conversation =@poster_user.mailbox.conversations.find(params[:id])
  end

  def new
    @conversation = current_user.mailbox.conversations.new
    @recipients = User.all - [current_user]
  end

  def create
    @recipient = User.find(params[:user_id])
    receipt = current_user.send_message(@recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end

 #  def inbox
 #   @inbox = mailbox.inbox
 #   @active = :inbox
 # end
 #
 # def sent
 #   @sent = mailbox.sentbox
 #   @active = :sent
 # end
 #
 # def trash
 #   @trash = mailbox.trash
 #   @active = :trash
 # end

end

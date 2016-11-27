class Account::ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification



  def index
    @mailbox = current_user.mailbox
    @conversations = @mailbox.conversations
  end

  def show
    #@order = OrderTwo.ids
    @mailbox = current_user.mailbox
    @conversation = @mailbox.conversations.find(params[:id])
    @receipts = @conversation.receipts.collect(&:receiver).uniq
  end

  def reply

    @mailbox ||= current_user.mailbox
    @conversation = @mailbox.conversations.find(params[:id])
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:notice] = "信息发送成功"
    redirect_to account_conversation_path(@conversation)
  end

  # def destroy
  #   @mailbox ||= current_user.mailbox
  #   @conversation = @mailbox.conversations.find(params[:id])
  #    @conversation.receipts_for(current_user).update_all(deleted: true)
  #   flash[:success] = 'The conversation was moved to trash.'
  #   redirect_to :back
  # end


end

class Account::UserConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification


def index
  @mailbox ||= current_user.mailbox
  @order = OrderTwo.find(params[:order_two_id])
  if current_user = @order.asker_user
     @user = @order.poster_user
  else
    @user = @order.asker_user
  end
  @conversation = @order.conversation
    @messages = @conversation.messages if @conversation.present?
end

def create
  @mailbox ||= current_user.mailbox
  #@user = User.find(params[:id])
  @order = OrderTwo.find(params[:order_two_id])
  @conversation = @order.conversation
  if current_user = @order.asker_user
     @user = @order.poster_user
  else
    @user = @order.asker_user
  end
  if @conversation.blank?
    current_user.send_message(@user , params[:body] , @order )
  else
    current_user.reply_to_conversation(@conversation, params[:body])
  end
   redirect_to account_conversations_path(:order_two_id => @order.id)
end
end

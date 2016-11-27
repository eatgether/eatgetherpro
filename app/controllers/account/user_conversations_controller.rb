class Account::UserConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification

  def index
    @mailbox ||= current_user.mailbox
    @order = OrderTwo.find(params[:order_two_id])
    if current_user == @order.asker_user
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
      if current_user == @order.asker_user

        @user = @order.poster_user
      else
        @user = @order.asker_user
      end
    if @conversation.blank?
      @conversation = current_user.send_message(@user , params[:body] , @order.post.title, @order).conversation
      #@conversation.order_two_id = @order.id
          #binding.pry
    else
       @conversation = current_user.reply_to_conversation(@conversation, params[:body])
    end
      redirect_to account_conversation_path(@order)
   end

  # def destroy
  #   @mailbox ||= current_user.mailbox
  #   @order = OrderTwo.find(params[:order_two_id])
  #   @conversation = @order.conversation
  #   @conversation.destroy
  # end

end

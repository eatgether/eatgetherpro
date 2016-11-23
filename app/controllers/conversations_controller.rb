class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
      @order = OrderTwo.find(params[:order_two_id])

      @conversation = @order.conversations

      @messages = @conversation.messages if @conversation.present?


    end

    def create
      @order = OrderTwo.find(params[:order_id])
      @conversation = @order.conversation

      if @conversation.blank?
        current_user.send_message(@order.user , params[:body] , @order.title, @order )
      else
        current_user.reply_to_conversation(@conversation, params[:body])
      end

      redirect_to order_two_conversations_path(@order)

    end

end

class Account::UserConversationsController < ApplicationController
  before_action :authenticate_user!


def show
  @mailbox ||= current_user.mailbox

  @user = User.find(params[:id])
end

def update
  @mailbox ||= current_user.mailbox

  @user = User.find(params[:id])

  conversation = current_user.send_message(@user, params[:body], @user.id ).conversation

  redirect_to account_conversation_path(conversation)
end
end

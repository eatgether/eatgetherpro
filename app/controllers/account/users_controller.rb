class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update

    @user = current_user
    if @user.update(user_params)
      # respond_to do |format|
      # format.js
    redirect_to account_users_path
    
    else
      render :edit

  end
end


  private

  def user_params
    params.require(:user).permit(:nameChi, :nameNick, :image, :gender, :birthday, :cellNum, :income, :description, :heightUser, interest_ids: [])
  end


end

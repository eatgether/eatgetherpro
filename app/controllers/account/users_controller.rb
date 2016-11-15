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
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to account_users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nameChi, :nameNick, :image, :gender, :birthday, :cellNum, :income, :heightUser)
  end


end

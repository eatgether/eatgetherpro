class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
     @users = User.all_except(current_user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def take_master
    @user = User.find(params[:id])
      @user.take_master!

      redirect_to :back
  end


  def customer
    @user = User.find(params[:id])
      @user.customer!

      redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:is_admin)
  end

end

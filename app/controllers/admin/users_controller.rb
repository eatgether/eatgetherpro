class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
     @users = User.all
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
end

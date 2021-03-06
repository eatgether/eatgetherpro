class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :get_notification

  layout "admin"

  def index
     #@users = User.all_except(current_user)
     @users=User.all_except(current_user).paginate(:page => params[:page],:per_page => 5).recent
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       @user.save!
    redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
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
    params.require(:user).permit(:email,:password,:password_confirmation,:is_admin,:nameChi, :nameNick, :image, :gender, :birthday, :cellNum, :income, :description, :heightUser, :work, interest_ids: [])
  end

end

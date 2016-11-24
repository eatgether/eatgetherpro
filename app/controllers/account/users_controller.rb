class Account::UsersController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @users = current_user
    @photo = @users.photos.all
  end

  def edit
    @user = current_user
    @photo = @user.photos.build
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.all
  end

  def photo
    @user = current_user
    @photos = @user.photos.all
  end

  def update
    @user = User.find(params[:id])

    if params[:photos] != nil
      @user.photos.destroy_all #need to destroy old pics first

      params[:photos]['avatar'].each do |a|
        @picture = @user.photos.create(:avatar => a)
      end

      @user.update(user_params)
      redirect_to account_users_path

    elsif @user.update(user_params)
      redirect_to account_users_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:nameChi, :nameNick, :image, :gender, :birthday, :cellNum, :income, :description, :heightUser, interest_ids: [], avatars: [])
  end


end

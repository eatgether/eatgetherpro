class InterestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:name, :user_id)
  end
end

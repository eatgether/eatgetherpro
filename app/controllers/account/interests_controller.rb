class Account::InterestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @interests = Interest.all
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to :back
  end
end

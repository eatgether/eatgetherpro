class Admin::InterestsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"
  def index
    @interests = Interest.all
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to admin_interests_path
  end
end

class Admin::InterestsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"
  def index
    @interests = Interest.all.recent.paginate(:page => params[:page],:per_page => 5)
  end

  def edit
   @interest = Interest.find(params[:id])
  end

  def update
    @interest = Interest.find(params[:id])
    if @interest.update(interest_params)
      redirect_to admin_interests_path
    else
      render :edit
    end
  end
  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to admin_interests_path
  end


    def interest_params
      params.require(:interest).permit(:name, :user_id)
    end
end

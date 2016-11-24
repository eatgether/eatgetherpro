class InterestsController < ApplicationController
  before_action :authenticate_user!
  #before_action :admin_required

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
    #@interest.user_id = @user.id
      redirect_to admin_interests_path
    else
      render :new
    end
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

  private

  def interest_params
    params.require(:interest).permit(:name, :user_id)
  end
end

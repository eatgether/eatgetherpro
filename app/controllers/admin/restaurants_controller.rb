class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :get_notification
  layout "admin"

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @photo = @restaurant.photos.build
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @photos = @restaurant.photos.all
  end


  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @restaurant.photos.create(:avatar => a)
        end
      end
      redirect_to admin_restaurants_path
    else
      render :new
   end
 end

 def update
   @restaurant = Restaurant.find(params[:id])
   if @restaurant.update(restaurant_params)
      @restaurant.save
      redirect_to admin_restaurants_path
   else
     render :edit
   end
 end

 def destroy
   @restaurant = Restaurant.find(params[:id])
   @restaurant.destroy
   redirect_to :back
 end

 def restaurant_params
   params.require(:restaurant).permit(:name, :description, :cellnum)
 end
end

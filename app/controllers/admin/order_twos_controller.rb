class Admin::OrderTwosController < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  def index
    @order_twos = OrderTwo.all
  end

  def destroy
    @order_two = OrderTwo.find(params[:id])
    @order_two.destroy
    redirect_to admin_order_twos_path
  end
end

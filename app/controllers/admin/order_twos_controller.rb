class Admin::OrderTwosController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_twos = OrderTwo.all
  end

  def destroy
    @order_two = OrderTwo.find(params[:id])
    @order_two.destroy
  end
end

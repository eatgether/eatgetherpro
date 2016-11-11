class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.poster_id = params[:poster_id]


    if @order.save!

      redirect_to admin_orders_path
    else
      render "admin/orders/index"
    end

  end

  def destroy
    @order = Order.find(params[:id])
    @order.delete
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:poster_id, :asker_id)
  end
end

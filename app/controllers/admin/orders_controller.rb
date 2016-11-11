class Admin::OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    if @order.save

      redirect_to admin_orders_path
    else
      render "admin/orders/index"
    end

  end

  private

  def order_params
    params.require(:order).permit(:poster_id, :asker_id)
  end
end

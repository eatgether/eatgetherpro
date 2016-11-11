class Admin::OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    @order.post_1_id =
    @order.post_2_id =

    if @order.save

    end

  end

  private

  def method_name
    params.require(:order).permit(:post_1_id,:post_2_id)
  end
end

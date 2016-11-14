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

	def confirm_cancel
		@order = Order.find(params[:id])
		if @order.aasm_state === "order_matched"
				@order.cancel_order!
				#add send email to user confirm cancellation
				flash[:warning] = "Order cancelled. User will be notified via email."
		else
			flash[:warning] = "Order cannot be cancelled. Check order status is 'order_matched'."
		end

		redirect_to :back
	end

	def undo_cancel
		@order = Order.find(params[:id])
		if @order.aasm_state === "order_cancelled"
			@order.revive_order!
			flash[:notice] = "Order revived. User will not be notified by email, please contact user manually."
		else
			flash[:warning] = 'Order cannot be revived. Check order status is "order_cancelled".'
		end
		redirect_to :back
	end

  def destroy
    @order = Order.find(params[:id])
    @order.delete
    redirect_to :back, warning: "Order removed."
  end

  private

  def order_params
    params.require(:order).permit(:poster_id, :asker_id)
  end
end

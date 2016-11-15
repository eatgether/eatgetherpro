class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @orders = Order.all
  #   @orders.each do |order|
  #     Post.id()
  #   end
  #   #@post = Post.where(:id in @orders.post_id)
   end

  def create
    @order = Order.new(order_params)
    @order.poster_id = params[:poster_id]
    @order.poster_user_id = @order.poster.user_id
    @order.asker_user_id = @order.asker.user_id

    if @order.save!
			OrderMailer.notify_order_placed(Order.last).deliver!
      redirect_to admin_orders_path
    else
      render "admin/orders/index"
    end

  end

	def confirm_cancel
		@order = Order.find(params[:id])
		if @order.aasm_state === "order_matched"
				@order.cancel_order!
				OrderMailer.notify_order_cancelled(Order.last).deliver!
				flash[:warning] = "Order cancelled. User will be notified via email."
		else
			flash[:alert] = "Order cannot be cancelled. Check order status is 'order_matched'."
		end

		redirect_to :back
	end

	def admin_revive
		@order = Order.find(params[:id])
		if @order.aasm_state === "order_cancelled" || @order.aasm_state === "order_met"
			@order.revive_order!
			OrderMailer.notify_order_revived(Order.last).deliver!
			flash[:notice] = "Order revived. User will be notified via email."
		else
			flash[:warning] = 'Order cannot be revived. Check order status is "order_cancelled" or "order_met".'
		end
		redirect_to :back
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

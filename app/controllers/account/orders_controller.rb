class Account::OrdersController < ApplicationController
  def index
    @orders = Order.where(:poster_user_id => current_user)
  end

	def show
		@orders = Order.find(params[:id])
	end


	def confirm_meeting
		@order = Order.find(params[:id])
		if @order.aasm_state === "order_matched"
			@order.metMatch!
			OrderMailer.notify_order_met(Order.last).deliver!
			flash[:notice] = "Congratulations on making a new friend! We kindly ask your feedback via email: xxx@xxx.com"
		else
			flash[:alert] = "Cannot confirm meeting. Please contact admin for support."
		end
		redirect_to :back
	end

	def ask_cancel
		@order = Order.find(params[:id])
		if @order.aasm_state === "order_matched"
				OrderMailer.notify_admin_cancel(Order.last).deliver!
				flash[:warning] = "We have received your cancelltion request. We will process your request as soon as we can."
		else
				flash[:warning] = "Order cannot be cancelled. Check if your order status is 'order_matched' or contact our support desk."
		end
		redirect_to :back
	end

end

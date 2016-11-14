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
			flash[:alert] = "Order cannot be cancelled. Check order status is 'order_matched'."
		end

		redirect_to :back
	end

	def undo_cancel
		@order = Order.find(params[:id])
		if @order.aasm_state === "order_cancelled"
			@order.revive_order!
			#add send email to user confirm reviving order
			flash[:notice] = "Order revived. User will be notified via email."
		else
			flash[:warning] = 'Order cannot be revived. Check order status is "order_cancelled".'
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

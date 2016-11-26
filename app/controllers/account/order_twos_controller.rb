class Account::OrderTwosController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification

  def index
    @order_twos = OrderTwo.where(:poster_user_id => current_user).or(OrderTwo.where(:asker_user_id => current_user))
  end

  def show
    @user = User.find(params[:id])
  end

  def confirm_meeting
    @order_twos = OrderTwo.find(params[:id])
    if @order_twos.order_matched?
      @order_twos.metMatch!
      OrderMailer.notify_order_met(@order_twos).deliver!
      flash[:notice] = "Congratulations on making a new friend! We kindly ask your feedback via email: xxx@xxx.com"
    else
      flash[:alert] = "Cannot confirm meeting. Please contact admin for support."
    end
    redirect_to :back
  end

  def ask_cancel
    @order_twos = OrderTwo.find(params[:id])
    if @order_twos.aasm_state === "order_matched"
        OrderMailer.notify_admin_cancel(@order_twos).deliver!
        flash[:warning] = "We have received your cancelltion request. We will process your request as soon as we can."
    else
        flash[:warning] = "OrderTwos cannot be cancelled. Check if your order status is 'order_matched' or contact our support desk."
    end
    redirect_to :back
  end

end

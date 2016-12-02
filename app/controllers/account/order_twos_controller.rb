class Account::OrderTwosController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification
  layout "order"

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
      #OrderMailer.notify_order_met(@order_twos).deliver!
      flash[:notice] = "恭喜您认识一个新朋友~ 请点击‘新建反馈’留下您的美好约饭记忆"
    else
      flash[:alert] = "无法确认邀约，请联系右下方服务人员，感谢您的理解~"
    end
    redirect_to :back
  end

  def ask_cancel
    @order_twos = OrderTwo.find(params[:id])
    if @order_twos.aasm_state === "order_matched"
        #OrderMailer.notify_admin_cancel(@order_twos).deliver!
        flash[:warning] = "我们已收到您的取消申请，服务人员将会第一时间给予回复"
    else
        flash[:warning] = "取消申请错误，请联系右下方服务人员帮助解决，感谢您的理解~"
    end
    redirect_to :back
  end

end

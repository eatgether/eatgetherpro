class Account::FeedbacksController < ApplicationController
	before_action :authenticate_user! , only: [:new, :create]
	before_action :get_notification
	before_action :set_order_two, only: [:new, :create, :edit, :update]
	layout "account", only: [:index]

	def index
		@feedbacks = current_user.feedbacks
	end

	def show
		@feedbacks = Feedback.find(params[:id])
	end

	def new
		if @order.feedbacks.where(:user_id => current_user).blank?
			@feedback = @order.feedbacks.new
		else
			redirect_to account_order_twos_path, notice: "反馈已填写，如需修改，请选择“修改反馈”进行修改。"
		end
	end

	def create
		@feedback = @order.feedbacks.build(feedback_params)
		@feedback.user = current_user
		@feedback.order_two_id = @order.id
		@feedback.rating = params[:rating]
		@feedback.save
		redirect_to account_order_twos_path, notice: "反馈已保存，感谢您的填写！"
	end

	def edit
		@feedback = current_user.feedbacks.find(params[:id])
	end

	def update
		@feedback = current_user.feedbacks.last
		if @feedback.update(feedback_params)
			redirect_to account_order_twos_path, notice: "反馈已更新。"
		else
			render :root
		end
	end

	def destroy
		@feedback = Feedback.find(params[:id])
		@feedback.destroy
		redirect_to :back
	end

	def rating
    # 获取message的参数
    feedback_id = params[:feedback_id]
    score = params[:rating]
    # 找到指定的message
    feedback = Feedback.find(feedback_id.to_i)
    # 为message评级
    feedback.rating = score
    feedback.save
    return 'success'
  end

	private

	def feedback_params
		params.require(:feedback).permit(:title, :description, :image)
	end

	def set_order_two
		@order = OrderTwo.find(params[:order_two_id])
	end


	# def find_order
	# 	@order = Order.find(params[:order_id])
	# end

	# def new
	# 	@order = Order.find(params[:order_id])
	# 	@feedback = Feedback.new
	# end

	# def create
	# 	@order = Order.find(params[:order_id])
	# 	@feedback = Feedback.new(feedback_params)
	# 	@feedback.user = current_user
	# 	@feedback.order = @order
	# 	@feedback.save
	#
	# 	redirect_to account_orders_path, notice: "反馈已保存，感谢您的填写！"
	# end

	# def edit
	# 	@feedback = Feedback.find(params[:id])
	# end

	# def update
	# 	@feedback = Feedback.find(params[:id])
	# 	if @feedback.update(feedback_params)
	# 		redirect_to account_orders_path, notice: "反馈已更新。"
	# 	else
	# 		render :root
	# 	end
	# end

end

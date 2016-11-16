class Account::FeedbacksController < ApplicationController
	before_action :authenticate_user! , only: [:new, :create]

	def new
		@order = Order.find(params[:order_id])
		@feedback = Feedback.new
	end

	def create
		@order = Order.find(params[:order_id])
		@feedback = Feedback.new(feedback_params)
		@feedback.user = current_user
		@feedback.order = @order
		@feedback.save

		redirect_to account_orders_path, notice: "反馈已保存，感谢您的填写！"
	end

	def edit
		@feedback = Feedback.find(params[:id])
	end

	def update
		@feedback = Feedback.find(params[:id])
		if @feedback.update(feedback_params)
			redirect_to account_orders_path, notice: "反馈已更新。"
		else
			render :root
		end
	end

	private

	def feedback_params
		params.require(:feedback).permit(:title, :description, :image)
	end

end

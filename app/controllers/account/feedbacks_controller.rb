class Account::FeedbacksController < ApplicationController
	before_action :authenticate_user! , only: [:new, :create]

	def index
		@feedbacks = Feedback.all
	end

	def new
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(feedback_params)
		@feedback.user = current_user
		@feedback.save

		redirect_to account_feedbacks_path, notice: "反馈已保存，感谢您的填写！"
	end

	# def edit
	# 	@order = Order.find(params[:order_id])
	# 	@feedback = Feedback.find(params[:id])
	# end

	def show
		@feedback = Feedback.find(params[:id])
	end



	# 用户只能更新反馈，不能删除
	# def destroy
	# 	@feedback = Feedback.find(params[:id])
	#
	# 	@feedback.destroy
	# 	redirect_to account_feedbacks_path, alert: 'Feedback Deleted.'
	# end

	private

	def feedback_params
		params.require(:feedback).permit(:title, :description, :image)
	end


end

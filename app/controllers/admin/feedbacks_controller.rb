class Admin::FeedbacksController < ApplicationController
  layout "admin"

	def index
		@feedbacks = Feedback.all
	end

	def edit
		@feedback = Feedback.find(params[:id])
	end

	def update
		@feedback = Feedback.find(params[:id])
		if @feedback.update(feedback_params)
			redirect_to admin_feedbacks_path, notice: "Feedback Updated."
		else
			render :edit
		end
	end

	def destroy
		# @order = Order.find(params[:order_id])
		@feedback = Feedback.find(params[:id])
		# @feedback = current_user.feedbacks.find(params[:id])
		@feedback.destroy
		# @feedback.order.delete(Order.find[:order_id])
		redirect_to admin_feedbacks_path, alert: "Feedback Deleted."
	end

	private

	def feedback_params
		params.require(:feedback).permit(:title, :description, :image)
	end

end

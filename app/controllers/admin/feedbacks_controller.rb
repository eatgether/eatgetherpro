class Admin::FeedbacksController < ApplicationController
  before_action :get_notification

  layout "admin"

	def index
		@feedbacks = Feedback.all.recent.paginate(:page => params[:page],:per_page => 5)
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

  def publish
    @feedback = Feedback.find(params[:id])
    @feedback.publish!
    redirect_to :back
  end

  def hide
    @feedback = Feedback.find(params[:id])
    @feedback.hide!
    redirect_to :back
  end

	private

	def feedback_params
		params.require(:feedback).permit(:title, :description, :image)
	end

end

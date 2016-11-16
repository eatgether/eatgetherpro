class Admin::FeedbacksController < ApplicationController

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
		@feedback = Feedback.find(params[:id])
		@feedback.destroy
		redirect_to admin_feedbacks_path, alert: "Feedback Deleted."
	end

	private

	def feedback_params
		params.require(:feedback).permit(:title, :description, :image)
	end

end

class FeedbacksController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  before_action :get_notification
  
	def index
		@feedbacks = Feedback.all
	end

	def show
		@feedback = Feedback.find(params[:id])
	end

end

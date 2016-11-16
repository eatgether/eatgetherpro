class FeedbacksController < ApplicationController

  before_action :authenticate_user! , only: [:new, :create]

	def index
		@feedbacks = Feedback.all
	end

	def show
		@feedback = Feedback.find(params[:id])
	end

end

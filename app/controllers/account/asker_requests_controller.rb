class Account::AskerRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification
  layout "order"

  def index
    @asker_requests = AskerRequest.where(user_id: current_user)
    # @posts = current_user.asker_requests
  end

  def destroy
    @asker_request = AskerRequest.find(params[:id])

    @asker_request.destroy
    redirect_to :back
    flash[:alert] = "取消成功"
  end

end

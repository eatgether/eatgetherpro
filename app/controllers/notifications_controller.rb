class NotificationsController < ApplicationController

  # def index
  #   @notifications = Notification.where(:recipient_id => current_user.id)
  # end
  # def show_notification
  #   @notification = Notification.find_by_id(params[:id])
  #
  #   if @notification.present? && @notification.notifiable_type == "AskerRequest"
  #     @asker_request = AskerRequest.find(@notifiable_id)
  #     @post = Post.find(@asker_request.post_id)
  #
  #     redirect_to @post
  #   end
  # end

  def redirect_notification
    @notification = Notification.find_by_id(params[:id])

    if @notification.present? && @notification.notifiable_type == "AskerRequest"
      @asker_request = AskerRequest.find(@notification.notifiable_id)
      @post = Post.find(@asker_request.post_id)
      @notification.read_at = DateTime.now
      @notification.save

      redirect_to account_post_path(@post)
    elsif @notification.present? && @notification.notifiable_type == "OrderTwo"
      @notification.read_at = DateTime.now
      @notification.save
      redirect_to account_order_twos_path
    end
  end

end

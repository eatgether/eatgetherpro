class NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(:recipient_id => current_user.id)
  end

end

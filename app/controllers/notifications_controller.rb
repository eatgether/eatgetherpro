class NotificationsController < ApplicationController

  def index
    @notifications = Notification.find_by_recipient_id(current_user.id)
  end

end

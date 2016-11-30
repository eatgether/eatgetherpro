module NotificationsHelper
  def get_post (notification)
    @asker_request = AskerRequest.find(notification.notifiable_id)
    @post = Post.find(@asker_request.post_id)
    return @post
  end
end

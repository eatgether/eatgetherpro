class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :mailbox


  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end

  def current_asker_request(user,post)
    @current_asker_request = AskerRequest.find_by_user_id_and_post_id(user,post)
  end

  def c_user
    @c_user = current_user
  end


# devise controlls below
	def new
  end

  private

  def resource_name
    :user
  end
  helper_method :resource_name

  def resource
    @resource ||= User.new
  end
  helper_method :resource

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :devise_mapping

  def resource_class
    User
  end
  helper_method :resource_class
# devise controlls above

private

 def mailbox
   @mailbox ||= current_user.mailbox
 end

  #创建notifications方法
  def send_notification!(trigger,recipient,notifiable)
    Notification.create(trigger_id: trigger,recipient_id: recipient,notifiable_id: notifiable.id,notifiable_type: notifiable.class)
  end

end

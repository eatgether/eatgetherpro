class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

end

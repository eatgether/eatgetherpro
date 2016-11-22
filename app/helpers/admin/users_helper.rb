module Admin::UsersHelper
  def render_user_created_at(user)
    user.created_at.to_s(:short)
  end
end

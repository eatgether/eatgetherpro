module Admin::UsersHelper
  def render_user_created_at(user)
    user.created_at.to_s(:short)
  end

  def render_user_gender(user)
    if user.gender == 'male'
      '男'
    else
      '女'
    end
  end
  
end

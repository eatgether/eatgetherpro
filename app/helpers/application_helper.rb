module ApplicationHelper
  def current_asker_request(user,post)
    @current_asker_request = AskerRequest.find_by_user_id_and_post_id(user,post)
  end
end

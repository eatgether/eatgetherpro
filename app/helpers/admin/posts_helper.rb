module Admin::PostsHelper
  def render_post_created_at(post)
    post.created_at.to_s(:short)
  end


end

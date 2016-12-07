module Account::AskerRequestsHelper

  def get_current_order_user_id(asker_request)
    @post = asker_request.post
    @order = OrderTwo.find_by_post_id(@post.id)
    if @order == nil && !asker_request.is_matched
      return nil
    else
      return @order.asker_user_id
    end
  end

  def render_account_asker_requests_index(asker_request)
  if asker_request.post.image.present?
    image_tag(asker_request.post.image.thumb.url)
  elsif asker_request.post.restaurant.photos.present?
    image_tag(asker_request.post.restaurant.photos[0].avatar.medium.url)
  else
    image_tag("https://ooo.0o0.ooo/2016/11/27/583a72fa39c8a.png")
  end
end

end

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
end

module Account::OrderTwosHelper

  def render_order_two_index(order)
     if order.post.image.present?
     image_tag(order.post.image.thumb.url,style:"width:250px; height:160px")
     elsif order.post.restaurant.photos.present?
     image_tag(order.post.restaurant.photos[0].avatar.medium.url, style:"width:250px; height:160px")
     else
     image_tag("https://ooo.0o0.ooo/2016/11/27/583a72fa39c8a.png",style:"width:250px; height:160px")
     end
  end

end

module PostsHelper

  def render_user_image_blank?(post)
     if post.user.image.present?
       image_tag(post.user.image.avatar.url, class: "post-thumbnails")
     else
       image_tag("https://ooo.0o0.ooo/2016/11/27/583a77b4cb159.png", class: "post-thumbnails", style: "width:60px;height:60px")
     end
  end


  def render_post_show_user_image_blank?(post)
     if post.user.image.present?
        image_tag(post.user.image.medium.url, class: "img-thumbnails")
     else
        image_tag("https://ooo.0o0.ooo/2016/11/27/583a77b4cb159.png", class: "img-thumbnails", style: "width:200px;")
      end
  end


  def render_restaurant_photos(post)
    if post.image.present?
       image_tag(post.image.thumb.url)
    elsif post.restaurant.photos.present?
       image_tag(post.restaurant.photos[0].avatar.medium.url)
    else
      image_tag("https://ooo.0o0.ooo/2016/11/27/583a72fa39c8a.png")
    end
  end

  def render_post_show_restaurant_photos(post)
     if post.image.present?
        image_tag(post.image.thumb.url, class: "thumbnail img-responsive center-block")
     elsif post.restaurant.photos.present?
        image_tag(post.restaurant.photos[0].avatar.medium.url)
    else
        image_tag("https://ooo.0o0.ooo/2016/11/30/583ec60514596.png", class: "thumbnail img-responsive center-block")
    end
  end 

end

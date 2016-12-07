module Account::PostsHelper

  def render_account_show_post_restaurant_photos(post)
     if post.image.present?
        image_tag(post.image.thumb.url, class: "thumbnail img-responsive center-block")
     elsif post.restaurant.photos.present?
        image_tag(post.restaurant.photos[0].avatar.medium.url)
     else
        image_tag("https://ooo.0o0.ooo/2016/11/27/583a72fa39c8a.png")
     end
   end

   def render_asker_user_image_in_account_post_show(asker_user)
     if asker_user.image.present?
      image_tag(asker_user.image.avatar.url, class: "img-thumbnails")
    else
      image_tag("https://ooo.0o0.ooo/2016/11/27/583a72fa39c8a.png", class: "thumbnail img-responsive center-block")
    end
  end

end

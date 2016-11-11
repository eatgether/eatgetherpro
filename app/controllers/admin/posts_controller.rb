class Admin::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
     @posts = Post.distinct.where('id NOT IN (SELECT poster_id FROM orders)
                                  AND id NOT IN (SELECT asker_id FROM orders)')
  end

  def checkout
    @post_2_id = Post.find(params[:id])
    puts "!!!!!!!!!!!!!!!!!#{@post_2_id}"
    redirect_to admin_posts_path(@post_2_id)
  end

  def confirm_order
    @post = Post.find(params[:id])
    #@post.post_2_id =
  end

end

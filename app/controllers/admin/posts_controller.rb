class Admin::PostsController < ApplicationController

  def index
    @posts = Post.all
    #puts "!!!!!!!!!!!!!!!!!#{@post_2_id}"
  end

  def get_post_2_id
    @post_2_id = Post.find(params[:id])
    puts "!!!!!!!!!!!!!!!!!#{@post_2_id}"
    redirect_to admin_posts_path(@post_2_id)
  end

end

class Admin::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @posts = Post.no_match
  end

  def checkout
    @post_2_id = Post.find(params[:id])
    redirect_to admin_posts_path(@post_2_id)
  end

  def confirm_order
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :eatVenue,:eatDay)
  end
end

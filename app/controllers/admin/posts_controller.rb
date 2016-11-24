class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :get_notification
  
  layout "admin"

  def index
    @posts = Post.no_match.paginate(:page => params[:page],:per_page => 5).recent
  end

  def show
    @post = Post.find(params[:id])
  end

  def checkout
    @post_2_id = Post.find(params[:id])
    redirect_to admin_posts_path(@post_2_id)
  end

  def confirm_order
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :eat_venue,:eat_day,:image,:eat_day_choose)
  end
end

class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :get_notification
  before_action :set_post, :except => [:index, :checkout]

  layout "admin"

  def index
    @posts = Post.no_match.paginate(:page => params[:page],:per_page => 5).recent
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      @post.save
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def checkout
    @post_2_id = Post.find(params[:id])
    redirect_to admin_posts_path(@post_2_id)
  end

  def confirm_order
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  def publish
    @post.publish!
    redirect_to :back
  end

  def hide
    @post.hide!
    redirect_to :back
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :eat_venue,:eat_day,:image,:eat_day_choose)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end

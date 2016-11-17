class PostsController < ApplicationController

   before_action :authenticate_user!,only:[:new,:create,:update,:edit,:destroy,:show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Update Success'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_path alert: 'Post deleted'
  end

  def application
    @post = Post.find(params[:id])

    if !current_user.is_asker_of?(@post)
      current_user.application!(@post)
      flash[:notice] = "您已成功申请！"
    else
      flash[:warning] = "您已经申请过这个邀约了！"
    end

    redirect_to :back
  end

  def cancel_application
    @post = Post.find(params[:id])

    if current_user.is_asker_of?(@post)
      current_user.cancel_application!(@post)
      flash[:alert] = "您已取消了申请！"
    else
      flash[:warning] = "您还没有申请该邀约哦！"
    end

    redirect_to :back
  end

  private



  def post_params
    params.require(:post).permit(:title, :description,:eat_venue,:eat_day,:image)
  end

end

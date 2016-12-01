class PostsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,:update,:edit,:destroy,:show]
  before_action :get_notification

  def index
    @posts = Post.page(params[:page]).per(6).recent.search(params[:search]).publish
    # @posts = Post.where(is_hidden = false)
  end

  def new
    @post = Post.new
    @restaurants = Restaurant.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @restaurants = Restaurant.all
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       @post_restaurant = PostRestaurant.new
       @post_restaurant.post_id = @post.id
       @post_restaurant.restaurant_id = @post.eat_venue
       @post_restaurant.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post_restaurant = @post.post_restaurant
    if @post.update(post_params)
       @post_restaurant.restaurant_id = @post.eat_venue
       @post_restaurant.save

      redirect_to posts_path, notice: 'Update Success'
    else
      render :edit
    end
  end

#   def update
#   @post = User.find_by(id: params[:id])
#   @post.title = params[:title]
#   @post.description = params[:description]
#   @post.eat_venue = params[:eat_venue]
#   @post.eat_day = params[:eat_day]
#   @post.image = params[:image]
#   @post.save
#   redirect_to account_posts_path
# end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_path alert: 'Post deleted'
  end

  def application
    @post = Post.find(params[:id])


    if !current_user.is_asker_of?(@post)
      current_user.application!(@post)

      @asker_request = AskerRequest.find_by_post_id_and_user_id(@post.id,current_user.id)
      send_notification!(current_user.id,@post.user_id,@asker_request)

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

  # def post_restaurant_params
  #   params.require(:post_restaurant).permit(:post_id, :restaurant_id)
  # end
end

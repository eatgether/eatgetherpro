class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_notification
  layout "order"

 def index
   @posts = current_user.posts
 end

 def new
   @post = Post.new
 end

 def show
   @post = Post.find(params[:id])
   @asker_users = @post.asker_users
 end

 def edit
   @post = Post.find(params[:id])
 end

 def create
   @post = Post.new(post_params)
   @post.user_id = current_user.id

   if @post.save
     redirect_to account_posts_path
   else
     render :new
     flash[:alert] = "请选择周末"
   end
 end

 def update
   @post = Post.find(params[:id])
   if @post.update(post_params)
     redirect_to account_posts_path, notice: 'Update Success'
   else
     render :edit
   end
 end

 def destroy
   @post = Post.find(params[:id])

   @post.destroy
   redirect_to :back
   flash[:alert] = "删除成功"
 end

 def application_approved
   @post = Post.find(params[:id])
   @asker_user = params[:asker_user]
   @order = OrderTwo.new
   @order.post_id = @post.id
   @order.poster_user_id = @post.user_id
   @order.asker_user_id = @asker_user
   @asker_request = current_asker_request(@asker_user,@post.id)
   if @order.save
     @asker_request.is_matched = true
     @asker_request.save
     redirect_to :back, notice: 'Application approved Success!'
   else
     redirect_to :back
   end
 end

 private

 def post_params
   params.require(:post).permit(:title, :description,:eat_venue,:eat_day,:image,:eat_day_choose)
 end
end

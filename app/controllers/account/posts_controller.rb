class Account::PostsController < ApplicationController
  before_action :authenticate_user!

 def index
   @posts = current_user.posts
	 flash[:notice] = "早安！你好！"
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
     redirect_to account_posts_path
   else
     render :new
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
   redirect_to account_posts_path, alert: 'Post deleted'
 end

 private



 def post_params
   params.require(:post).permit(:title, :description,:eat_venue,:eat_day,:image)
 end
end

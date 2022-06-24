class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts.includes(:user, :comments)

    render json: @posts, status: ok
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      render json: @post, status: :created
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      flash.now[:error] = 'Error: Post could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:user, :comments).find(params[:id])
    @comment = @post.recent_comments

    render json: @post, status: ok
    render json: @comment, status: ok
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to user_posts_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  private

  def post_params
    my_post = params.require(:post).permit(:title, :text)
    my_post[:user] = current_user
    my_post
  end
end

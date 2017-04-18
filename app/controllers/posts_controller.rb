class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    # avoid n + 1 queries, include author to access fname/lname
    @posts = Post.order(created_at: :desc).includes(:author).includes(:comments)
    render :index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:messages] = ["invalid post"]
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notices] = ["Post updated"]
      if request.referer == edit_post_url(@post)
        redirect_to @post
      else
        redirect_to request.referer
      end
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :asc)
    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notices] = ["Post deleted"]
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(
      :title, :body, :user_id
    )
  end
end

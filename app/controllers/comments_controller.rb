class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @comment = Comment.new(post_id: params[:post_id])
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:messages] = ["invalid comment"]
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:notices] = ["Comment updated"]
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  # def show
  #   @comment = Comment.find(params[:id])
  #   render :show
  # end

  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    @comment.destroy
    flash[:notices] = ["Comment deleted"]
    redirect_to post_url(post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(
      :post_id, :body, :user_id
    )
  end
end

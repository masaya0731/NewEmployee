class Public::PostCommentsController < ApplicationController

  def edit
    @post_comment = PostComment.find(params[:id])
  end

  def update
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update(post_comment_params)
      redirect_to public_post_path
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_customer.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
       @post.create_notification_post_comment!(current_customer, @comment.id)
      redirect_to public_post_path(@post)
      flash[:success] = "コメントしました"
    end
  end

  def destroy
    if PostComment.find_by(id: params[:id]).destroy
      redirect_to public_post_path(params[:post_id])
      flash[:danger] = 'コメントを削除しました'
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body, :comment_image, :post_id)
  end
end

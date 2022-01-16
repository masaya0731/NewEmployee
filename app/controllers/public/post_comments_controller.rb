class Public::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_customer.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to public_post_path(@post)
      flash[:success] = "コメントしました"
    end
  end

  def destroy
    if PostComment.find_by(id: params[:id]).destroy
      redirect_to public_post_path(params[:post_id])
      flash[:danger] = '投稿を削除しました'
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body, :comment_image, :post_id)
  end
end

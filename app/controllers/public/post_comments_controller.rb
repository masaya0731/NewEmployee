class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_image_path(post)
  end

  def destroy; end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body, :comment_image)
  end
end

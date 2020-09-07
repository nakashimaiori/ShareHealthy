class PostCommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	comment = current_user.post_comments.new(post_comment_params)
  	comment.post_id = @post.id
  	comment.save
  	# redirect_to post_path(post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
  	# PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    # redirect_to post_path(params[:post_id])
    comment = PostComment.find(params[:id])
    comment.destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

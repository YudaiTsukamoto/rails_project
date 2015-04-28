class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
  end
  redirect_to user_post_path(@user,@post)


  private
  def comment_params
    params.require(:comment).permit(:commenter, :context)
  end
end

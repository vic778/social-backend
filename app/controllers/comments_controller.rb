class CommentsController < PermissionsController
  before_action :authenticate_user!

  def create
    post = Post.find_by(id: params[:post_id])
    comment = post.comments.build(comment_params)
    comment.user_id = current_user.id
    if comment.save
      render json: { success: true, message: "Comment created successfully", comment: comment }, status: :created
    else
      render json: { success: false, message: comment.errors.full_messages }, status: 422
    end
  end

  def destroy
    post = Post.find_by(id: params[:post_id])
    comment = post.comments.find_by(id: params[:id])
    if comment.destroy
      render json: { success: true, message: "Comment deleted successfully" }, status: :ok
    else
      render json: { success: false, message: comment.errors.full_messages}, status: 422
    end
  end

  private

  def comment_params
    params.permit(:post_id, :user_id, :content)
  end
end

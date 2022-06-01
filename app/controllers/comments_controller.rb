class CommentsController < PermissionsController
  before_action :authenticate_user!

  def create
    @comment = Comment.create(comment_params.merge(user_id: current_user.id))
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: { success: true, message: "Comment created successfully", comment: @comment }, status: :created
    else
      render json: { success: false, message: @comment.errors.full_messages }, status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: { success: true, message: "Comment deleted successfully", comment: @comment }, status: :ok
    else
      render json: { success: false, message: @comment.errors.full_messages, comment: @comment }, status: 422
    end
  end

  private

  def comment_params
    params.permit(:post_id, :user_id, :content)
  end
end

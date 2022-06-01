class LikesController < PermissionsController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: current_user.id)
    @like.save
    render json: { post: @post, like: @like }
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user_id: current_user.id)
    @like.destroy
    render json: { post: @post, like: @like }
  end
end

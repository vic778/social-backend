class RelationshipsController < PermissionsController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    rel = Relationship.new(followed_id: current_user.id, follower_id: user.id)
    if rel.save
      render json: { sucess: true, message: "You have followed #{current_user.name} succefuflly", data: rel }, status: :ok
    else
      render json: { sucess: false, message: rel.errors }, status: :ok
    end
  end

  def destroy
    followed = Relationship.where(followed_id: current_user.id)
    rel = followed.find_by(follower_id: params[:user_id])
    if rel.destroy
      render json: { status: 'SUCCESS', message: 'Unfollowed', data: rel }, status: :ok
    else
      render json: { status: :error }
    end
  end

end

class RelationshipsController < PermissionsController
    before_action :authenticate_user!

    def create
        @user = User.find(params[:user_id])
        @rel = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
        if @rel.save
            render json: { status: 'SUCCESS', message: 'Followed', data: @rel }, status: :ok
        else
            render json: { status: :error }
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @rel = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
        if @rel.destroy
            render json: { status: 'SUCCESS', message: 'Unfollowed', data: @rel }, status: :ok
        else
            render json: { status: :error }
        end
    end
end

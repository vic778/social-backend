class UsersController < PermissionsController
  before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users
  end

  def show
    user = User.find(params[:id])
    # @rel = @user.relationships.find_by(follower_id: current_user.id)
    # @like = @user.likes.find_by(user_id: current_user.id)
    render json: user
  end

  def update
    if current_user.update!(user_params)
      render json: {
        user: current_user
      }
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def auto_login
    render json: {
      user: current_user
    }
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name, :profile, :bio)
  end
end

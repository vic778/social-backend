class PostsController < PermissionsController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_post, only: [:update, :destroy]

    def index
        @posts = Post.all.order('created_at DESC')
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create 
        @post = Post.create(post_params.merge(user_id: current_user.id))
        if @post.save
            render json: {success: true, message: "Post created successfully", post: @post}, status: :created
        else
            render json: {success: false, message: @post.errors.full_messages}, status: 422
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            render json: {success: true, message: "Post updated successfully", post: @post}, status: :ok
        else
            render json: {success: false, message: @post.errors.full_messages, post: @post}, status: 422
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            render json: {success: true, message: "Post deleted successfully", post: @post}, status: :ok
        else
            render json: {success: false, message: @post.errors.full_messages, post: @post}, status: 422
        end
    end

    private
    def set_post
        @post = current_user.posts.find(params[:id])
    end

    def post_params
        params.permit(:image, :description, :video, :user_id)
    end

end

class PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def create
        post = Post.new(post_params)
        if post.valid?
            post.save
            render json: post
        else
            byebug
        end
        
    end

    def show
        post = Post.find(params[:id])
        render json: post, include: :comments
    end

    def index
        posts = Post.all
        render json: posts
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :lat, :lng, :user_id)
    end

end

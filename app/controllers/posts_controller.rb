class PostsController < ApplicationController

    def create
        post = Post.create(post_params)
        render json: post
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    private

    def post_params
        params.require(:post).permit(:title, :comtent, :user_id)
    end

end
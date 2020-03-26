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
        image = rails_blob_path(post.image)
        render json: {post: post, image: image, comments: post.comments}
    end

    def index
        posts = Post.all
        render json: posts
    end

     def update
        post = Post.find(params[:id])
        post.update(image: params[:image])
        
        image_url = rails_blob_path(post.image)
        render json: {post: post, image_url: image_url}
    end


    private

    def post_params
        params.require(:post).permit(:title, :content, :lat, :lng, :user_id)
    end

end

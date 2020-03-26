class CommentsController < ApplicationController
     skip_before_action :authorized, only: [:get_comments]

    def create
        comment = Comment.create(comment_params)
        
        render json: {comment: comment, user_info: {avatar_url: rails_blob_path(comment.user.avatar), username: comment.user.username}}
    end


    def get_comments
        post = Post.find(params[:id])
        user_info = post.comments.map do |comment|
            hash = {}
            avatar_url = rails_blob_path(comment.user.avatar)
            hash.merge({}, avatar_url: avatar_url, username: comment.user.username)
        end
        render json: {comments: post.comments, user: user_info}
    end

    private
    
    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end

end
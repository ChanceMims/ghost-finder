class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :update]

    def profile
        avatar_url = rails_blob_path(current_user.avatar)
        render json: {user: current_user, avatar_url: avatar_url}, status: :accepted
    end

    def update
        user = User.find(params[:id])
        user.update(avatar: params[:avatar])
        avatar_url = rails_blob_path(user.avatar)
        render json: {user: user, avatar_url: avatar_url, jwt: token}
    end

    def create
        # byebug
        user = User.new(user_params)
        # byebug
         if user.valid?
            user.save
            token = encode_token(user_id: user.id)
            render json: {user: user, jwt: token , status: :created}
        else
            render json: {error: 'failed to create user', status: :not_acceptable}
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: user_login_params[:username])
        if user && user.authenticate(user_login_params[:password])
            token = encode_token({user_id: user.id})
            puts 'works'
            render json: {user: user, decks: user.decks , jwt: token , status: :created}
        else
            render json: { error: 'Invalid username or password' , status: :unauthorized}
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end

end

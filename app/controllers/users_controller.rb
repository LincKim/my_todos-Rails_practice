class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        cookies[:email] = user.email 
        render json: { data: user, message: "User created successfully" }
    end

    def update 
        id = params[:id].to_i
        user = User.find(id)
        user.update(user_params)
        render json: { message: "user updated successfully" }
    end

    def index 
        render json: { data: User.all }
    end

    # TODO: delete, show_individual_user, logout(session)

    def login 
        email = params[:email]
        session[:email] = email
        render json: { message: "you are logged in" }
    end
    

    private 

    def user_params 
        params.permit(:email, :password)
    end

end

class UsersController < ApplicationController

def create
user = User.create!(user_params)
 if user.valid?
    render json: user, status: :created
 else
    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
 end
end


def show
   user = find_by(id: session[:user_id])
   if user
    render json: user, status: :created
   else
    render json: { errors: "NOt authorized" }, status: :unauthorized 
   end
end

private

def user_params()
params.permit(:username, :password)
end

end

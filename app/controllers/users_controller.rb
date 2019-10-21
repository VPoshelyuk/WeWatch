class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = "Your Account Has Been Created Successfully!"
            redirect_to user_path
        else
            flash[:notice] = "Please Try Again"
            redirect_to new_user_path
        end
    end

    def signin
        @user = User.find(params[:id])
        redirect_to user_path(@user)
    end 


    private

    def user_params
        params.require(:user).permit(
            :user_name,
            :first_name,
            :last_name,
            :age,
            :password,
            :phone_number
        )
    end 
end

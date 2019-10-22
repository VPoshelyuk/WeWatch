class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :signin]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            byebug
            flash[:notice] = "Your Account Has Been Created Successfully!"
<<<<<<< HEAD
            session[:user_id] = @user.id
            redirect_to user_path
=======
            redirect_to user_path(@user)
>>>>>>> refs/remotes/origin/master
        else
            byebug
            flash[:notice] = "Please Try Again"
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def signin
        redirect_to user_path(@user)
    end 

    def edit
    end

    def update
        @user.update(user_params)

        if @user.save
            flash[:notice] = "Your Account Has Been Created Successfully!"
            redirect_to user_path
        else
            flash[:notice] = "Please Try Again"
            redirect_to new_user_path
        end
    end


    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(
            :user_name,
            :first_name,
            :last_name,
            :age,
            :password,
            :password_confirmation,
            :phone_number
        )
    end 
end

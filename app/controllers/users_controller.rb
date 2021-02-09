class UsersController < ApplicationController 


    def new 
        @user = User.new
        render :new
    end 


     def create 
        @user = User.new(user_params)
        login_user!(@user)
        if @user.save 
            login!(@user)
            redirect_to bands_url
        else
            render json: @user.errors.full_messages, status: 422
        end 
    end 

    def user_params
        self.params.require(:user).permit(:email, :password)
    end 
end 
class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @users = User.all.limit(7) # Eliseu: This must be changed to filter only friends
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end
  
    private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :country, :age, :gender, :admin, :photo)
    end
  end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @spaceship.user.admin = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path  # Eliseu: to be confirmed
  end

  def destroy
    @user = User.find(params[:id])
    @user.admin = current_user
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :country, :age, :gender, :admin )
  end
end

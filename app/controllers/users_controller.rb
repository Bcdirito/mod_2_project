class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
  end
end

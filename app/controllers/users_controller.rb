class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    if !session[:user_id].nil?
      log_out
    end
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      # @user = User.new
      flash[:message] = "Password did not match confirmation"
      redirect_to new_user_path
      return
    end

    @user = User.new(user_params)

    if @user.valid?
      @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
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
    Review.all.each do |review|
      if @user.id == review.user_id
        review.destroy
      end
    end
    @user.destroy
    redirect_to "/"
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
  end
end

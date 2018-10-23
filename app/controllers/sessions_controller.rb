class SessionsController < ApplicationController
  def new
  end

  def create
    byebug
    @user = User.find_or_create_by(user_name: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Invalid Username/Password"
      render "/"
    end
  end

  def destroy
    session.delete :user_id
  end
end

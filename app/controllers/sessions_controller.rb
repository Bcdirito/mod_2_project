class SessionsController < ApplicationController
  def new
    if !session.empty?
      session.clear
    end
  end

  def create
    byebug
    @user = User.find_or_create_by(user_name: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to user_path(@user)
    else
      flash[:message] = "Invalid Username/Password"
      render "/"
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end
end

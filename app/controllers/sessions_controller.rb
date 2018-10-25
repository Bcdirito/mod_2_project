class SessionsController < ApplicationController

  def login
    log_out
  end

  def new_listener
    if !session.empty?
      session.clear
    end
  end

  def create_listener
    @listener = Listener.find_or_create_by(user_name: params[:username])
    if @listener && @listener.authenticate(params[:password])
      log_in_listener(@listener)
      redirect_to listener_path(@listener)
    else
      render "/sessions/new_listener"
      flash[:message] = "Invalid Username/Password"
    end
  end

  def new_musician
    if !session.empty?
      session.clear
    end
  end

  def create_musician
    @musician = Musician.find_or_create_by(user_name: params[:username])
    if @musician && @musician.authenticate(params[:password])
      log_in_musician(@musician)
      redirect_to musician_path(@musician)
    else
      flash[:message] = "Invalid Username/Password"
      render "/sessions/new_musician"
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end
end

class ApplicationController < ActionController::Base
  before_action :invalid_url

  def welcome
    render :layout => "welcome"
  end

  def signup
  end

  def profile_path
    if !session[:listener_id].nil?
      redirect_to listener_path(session[:listener_id])
      return
    elsif !session[:musician_id].nil?
      redirect_to musician_path(session[:musician_id])
      return
    else
      redirect_to "/login"
    end
  end

  private
  def log_in_listener(listener)
    session[:listener_id] = listener.id
  end

  def log_in_musician(musician)
    session[:musician_id] = musician.id
  end

  def invalid_url
    if !params[:not_found].nil?
      flash[:message] = "Invalid Path. Path Does Not Exist."
    end
  end

  def musician_logged
    if session[:musician_id].nil?
      redirect_to "/login"
      flash[:message] = "You are not authorized to do this."
      return
    elsif session[:musician_id] != params[:id].to_i
      redirect_to musician_path(session[:musician_id])
      flash[:message] = "You must be logged in as the musician to do this."
    end
  end

  def listener_logged
    if session[:listener_id].nil?
      redirect_to "/login"
      flash[:message] = "You must be logged in as a listener to do this."
    end
  end

  def id_checker(id)
    if id.to_i == 0 || id.to_i > Musician.last.id
      return true
    end
  end


  def review_info(profile)
    session[:review_id] = profile.id
  end

  def log_out
    if !session[:listener_id].nil?
      session.delete(:listener_id)
    elsif !session[:musician_id].nil?
      session.delete(:musician_id)
    end
    session.delete(:review_class)
    session.delete(:review_id)
  end
end

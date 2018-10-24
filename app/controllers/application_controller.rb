class ApplicationController < ActionController::Base

  def welcome
    render :layout => "welcome"
  end

  private
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    session.delete(:review_class)
    session.delete(:review_id)
  end

  def review_info(profile)
    if profile.class == Musician
      session[:review_class] = "musician"
    elsif profile.class == User
      session[:review_class] = "user"
    end
      session[:review_id] = profile.id
  end
end

class ApplicationController < ActionController::Base
  def welcome
    render :layout => "welcome"
  end

  private
  # Logs in the given user.
  def log_in_listener(listener)
    session[:listener_id] = listener.id
  end

  def log_in_musician(musician)
    session[:musician_id] = musician.id
  end

  # Logs out the current user.
  def log_out
    if !session[:listener_id].nil?
      session.delete(:listener_id)
    elsif !session[:musician_id].nil?
      session.delete(:musician_id)
    end
    session.delete(:review_class)
    session.delete(:review_id)
  end

  def review_info(profile)
    if profile.class == Musician
      session[:review_class] = "musician"
    elsif profile.class == Listener
      session[:review_class] = "listener"
    end
      session[:review_id] = profile.id
  end
end

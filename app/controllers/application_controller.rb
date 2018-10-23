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
    end
end

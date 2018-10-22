class User < ApplicationRecord
  has_many :reviews
  has_many :musicians, through: :reviews
  has_secure_password

  def new
  end

def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    redirect_to '/'
  else
    redirect_to '/signup'
  end
end

def user_params
  params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
end
end

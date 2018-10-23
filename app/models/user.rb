require 'bcrypt'

class User < ApplicationRecord
  has_many :reviews
  has_many :musicians, through: :reviews
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  def new
  end

  def password=(value)
    self.password_digest = BCrypt::Password.create(value)
  end

  def authenticate(plaintext_password)
    byebug
    BCrypt::Password.new(self.password_digest) == plaintext_password
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

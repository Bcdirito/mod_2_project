class User < ApplicationRecord
  has_many :reviews
  has_many :musicians, through: :reviews
end

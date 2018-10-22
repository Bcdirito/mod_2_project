class Musician < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :reviews
  has_many :users, through: :review
end

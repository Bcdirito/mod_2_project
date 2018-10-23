class Genre < ApplicationRecord
  has_many :musiciangenres
  has_many :musicians, through: :musiciangenres
end

class Musician < ApplicationRecord
  has_many :musiciangenres
  has_many :genres, through: :musiciangenres
  has_many :reviews
  has_many :users, through: :review

  validates :name, presence: true
  validates :bio, presence: true


  def average_rating
    if self.reviews.count == 0
      self.rate
    else
      self.reviews.each {|review| self.rate += review.rating}
      self.rate = self.rate / self.reviews.count
    end
    self.rate
  end
end

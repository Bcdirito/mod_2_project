class Musician < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :reviews
  has_many :users, through: :review

  validates :genre, presence: true

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

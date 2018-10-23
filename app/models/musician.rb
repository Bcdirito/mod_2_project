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

  def self.search(search)
    if search
      musician = Musician.find_by(name: search)
      if musician
        self.where(id: musician.id)
      else
        Musician.all
      end
    else
      Musician.all
    end
  end
end

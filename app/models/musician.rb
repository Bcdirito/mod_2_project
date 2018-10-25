class Musician < ApplicationRecord
  has_many :musiciangenres
  has_many :genres, through: :musiciangenres
  has_many :reviews
  has_many :users, through: :review

  validates :name, presence: true
  validates :bio, presence: true

  has_secure_password

  def new
  end

  def password=(value)
    self.password_digest = BCrypt::Password.create(value)
  end

  def average_rating
    if self.reviews.count == 0
      self.rate
    else
      self.reviews.each {|review| self.rate += review.rating}
      self.rate = self.rate / self.reviews.count
    end
    self.rate
  end

  def recent_reviews
    reviews = self.reviews
    if !reviews.empty?
      recent_reviews = reviews.sort_by {|k, v| [:updated_at]}
      if recent_reviews.count >= 3
        recent_reviews = recent_reviews[-3..-1]
      end
    else
      recent_reviews = reviews
    end
    recent_reviews
  end

  def self.search(search)
    if search
      musician = Musician.find {|mus| mus.name.downcase == search.downcase}
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

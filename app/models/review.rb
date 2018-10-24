class Review < ApplicationRecord
  belongs_to :user
  belongs_to :musician

  def self.user_filter(user_id)
    user = User.find(user_id)
    reviews = Review.all.select {|rev| rev.user_id == user.id}
    reviews
  end

  def self.musician_filter(musician_id)
    musician = Musician.find(musician_id)
    reviews = Review.all.select {|rev| rev.user_id == musician.id}
    reviews
  end
end

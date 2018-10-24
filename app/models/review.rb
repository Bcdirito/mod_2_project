class Review < ApplicationRecord
  belongs_to :user
  belongs_to :musician

  def self.rev_search(review_class, review_id)
    if review_class == "musician"
      reviews = Review.all.select {|rev| rev.musician_id == review_id}
    elsif review_class == "user"
      reviews = Review.all.select {|rev| rev.user_id == review_id}
    end
    reviews
  end
end

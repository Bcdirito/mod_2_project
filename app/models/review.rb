class Review < ApplicationRecord
  belongs_to :listener
  belongs_to :musician

  def self.rev_search(review_class, review_id)
    if review_class == "musician"
      reviews = Review.all.select {|rev| rev.musician_id == review_id}
    elsif review_class == "listener"
      reviews = Review.all.select {|rev| rev.listener_id == review_id}
    end
    reviews
  end
end

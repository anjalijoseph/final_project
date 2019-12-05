class HotelReview < ApplicationRecord
  # Direct associations

  belongs_to :hotel,
             :counter_cache => :reviews_count

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end

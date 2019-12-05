class Hotel < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :class_name => "HotelReview",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

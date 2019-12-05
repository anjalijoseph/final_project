class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :restaurant_reviews

  # Indirect associations

  # Validations

end

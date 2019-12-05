class AddRestaurantReviewCountToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :restaurant_reviews_count, :integer
  end
end

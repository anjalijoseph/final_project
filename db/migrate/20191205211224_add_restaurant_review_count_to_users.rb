class AddRestaurantReviewCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :restaurant_reviews_count, :integer
  end
end

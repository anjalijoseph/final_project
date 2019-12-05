class AddHotelReviewCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hotel_reviews_count, :integer
  end
end

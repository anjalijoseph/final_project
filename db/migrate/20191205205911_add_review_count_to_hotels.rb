class AddReviewCountToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :reviews_count, :integer
  end
end

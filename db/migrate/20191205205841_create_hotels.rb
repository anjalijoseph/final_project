class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :hotel_address
      t.integer :pet_fee

      t.timestamps
    end
  end
end

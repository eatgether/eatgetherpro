class CreatePostRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :post_restaurants do |t|
      t.integer :post_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end

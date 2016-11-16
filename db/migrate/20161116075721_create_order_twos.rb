class CreateOrderTwos < ActiveRecord::Migration[5.0]
  def change
    create_table :order_twos do |t|
      t.integer :post_id
      t.integer :poster_user_id
      t.integer :asker_user_id

      t.timestamps
    end
  end
end

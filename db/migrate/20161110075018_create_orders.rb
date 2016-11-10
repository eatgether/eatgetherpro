class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :post_1_id
      t.integer :post_2_id

      t.timestamps
    end
  end
end

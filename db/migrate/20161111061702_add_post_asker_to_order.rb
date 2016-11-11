class AddPostAskerToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :asker_id, :integer
    add_column :orders, :poster_id, :integer
    remove_column :orders, :post_1_id
    remove_column :orders, :post_2_id
  end
end

class AddPostAskerToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :asker_id, :integer
    add_column :orders, :poster_id, :integer
  end
end

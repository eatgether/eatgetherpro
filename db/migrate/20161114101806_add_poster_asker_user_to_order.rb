class AddPosterAskerUserToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :poster_user_id, :integer
    add_column :orders, :asker_user_id, :integer
  end
end

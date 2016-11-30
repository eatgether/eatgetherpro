class AddUserWork < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :work, :string
  end
end

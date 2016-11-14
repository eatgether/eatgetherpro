class AddSomeDetailToUserInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nameChi, :string
    add_column :users, :nameNick, :string
    add_column :users, :image, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :cellNum, :integer
    add_column :users, :income, :integer
    add_column :users, :heightUser, :integer
  end
end

class ChangeUserDefaultToIncomeHeight < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :income, :integer
    remove_column :users, :heightUser, :integer
    add_column :users, :income, :integer, default: 1
    add_column :users, :heightUser, :integer, default: 1
  end
end

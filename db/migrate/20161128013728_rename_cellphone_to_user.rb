class RenameCellphoneToUser < ActiveRecord::Migration[5.0]
  def change
  remove_column :users, :cellNum, :integer
  add_column :users, :cellNum, :string
  end
end

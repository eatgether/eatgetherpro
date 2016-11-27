class ChangeCellphoneToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :cellNum, :integer, limit: 16
  end
end

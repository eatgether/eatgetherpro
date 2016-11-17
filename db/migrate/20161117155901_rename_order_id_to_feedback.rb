class RenameOrderIdToFeedback < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedbacks,:order_id,:order_two_id
  end
end

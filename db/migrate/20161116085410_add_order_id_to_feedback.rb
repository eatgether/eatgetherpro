class AddOrderIdToFeedback < ActiveRecord::Migration[5.0]
  def change
	  add_column :feedbacks, :order_id, :integer
  end
end

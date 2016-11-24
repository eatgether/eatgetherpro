class AddOrderIdToConversation < ActiveRecord::Migration[5.0]
  def change
    add_column :mailboxer_conversations, :order_two_id, :integer
  end
end

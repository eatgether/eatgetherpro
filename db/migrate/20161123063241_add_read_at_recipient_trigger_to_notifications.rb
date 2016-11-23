class AddReadAtRecipientTriggerToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :read_at, :datetime
    add_column :notifications, :recipient_id, :integer
    add_column :notifications, :trigger_id, :integer
  end
end

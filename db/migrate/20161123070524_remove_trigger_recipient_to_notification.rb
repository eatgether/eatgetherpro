class RemoveTriggerRecipientToNotification < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications,:recipient
    remove_column :notifications,:trigger
  end
end

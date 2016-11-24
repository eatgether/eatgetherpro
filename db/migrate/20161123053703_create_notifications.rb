class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string  :name
      t.integer :notifiable_id
      t.string  :notifiable_type
      t.timestamps
    end
  end
end

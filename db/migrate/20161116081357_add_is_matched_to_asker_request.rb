class AddIsMatchedToAskerRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :asker_requests, :is_matched, :boolean,default: false
  end
end

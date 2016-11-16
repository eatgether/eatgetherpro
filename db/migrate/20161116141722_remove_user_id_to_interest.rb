class RemoveUserIdToInterest < ActiveRecord::Migration[5.0]
  def change
    remove_column :interests ,:user_id
  end
end

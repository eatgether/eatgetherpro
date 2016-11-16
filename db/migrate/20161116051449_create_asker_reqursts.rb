class CreateAskerReqursts < ActiveRecord::Migration[5.0]
  def change
    create_table :asker_reqursts do |t|
      t.integer :asker_user_id
      t.integer :post_id

      t.timestamps
    end
  end
end

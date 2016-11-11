class AddPost2IdToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :post_2_id, :integer
  end
end

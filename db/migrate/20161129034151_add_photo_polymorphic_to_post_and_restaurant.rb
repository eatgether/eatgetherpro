class AddPhotoPolymorphicToPostAndRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :photoable_type, :string
    add_column :photos, :photoable_id, :integer
    add_column :photos, :restaurant_id, :integer
  end
end

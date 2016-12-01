class AddCellnumToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :cellnum, :string
  end
end

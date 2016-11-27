class ChangeEatVenueInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :eat_venue, :integer
  end
end

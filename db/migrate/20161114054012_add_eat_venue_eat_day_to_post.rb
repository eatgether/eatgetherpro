class AddEatVenueEatDayToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :eat_venue, :string
    add_column :posts, :eat_day, :date
  end
end

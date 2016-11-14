class AddEatVenueEatDayToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :eatVenue, :string
    add_column :posts, :eatDay, :date
  end
end

class FixEatVenueAndEatDayToPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts,:eatVenue,:eat_venue
    rename_column :posts,:eatDay,:eat_day
  end
end

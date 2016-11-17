class EatDayToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :eat_day, :date
  end
end

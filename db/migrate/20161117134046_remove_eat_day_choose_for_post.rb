class RemoveEatDayChooseForPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts,:eat_day_choose
  end
end

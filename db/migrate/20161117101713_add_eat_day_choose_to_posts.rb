class AddEatDayChooseToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :eat_day_choose,:boolean
  end
end

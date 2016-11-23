class AddRatingToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :rating, :integer
  end
end

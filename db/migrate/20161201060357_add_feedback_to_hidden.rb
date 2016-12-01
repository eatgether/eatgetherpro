class AddFeedbackToHidden < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :is_hidden, :boolean, default: true
  end
end

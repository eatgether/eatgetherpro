class AddPhoneNumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile_number, :string
    add_column :users, :verification_code, :string
    add_column :users, :is_verified, :boolean, default: false
  end
end

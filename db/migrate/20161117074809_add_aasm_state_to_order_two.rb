class AddAasmStateToOrderTwo < ActiveRecord::Migration[5.0]
  def change
    add_column :order_twos, :aasm_state, :string, default: "order_matched"
		add_index :order_twos, :aasm_state
  end
end

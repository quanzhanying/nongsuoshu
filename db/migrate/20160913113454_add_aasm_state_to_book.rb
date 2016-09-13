class AddAasmStateToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :aasm_state, :string, default: "book_created"
    add_index :books, :aasm_state
  end
end

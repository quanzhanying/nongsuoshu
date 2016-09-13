class AddIsFreeToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :is_free, :boolean, default: false
    add_column :books, :is_editor_choice, :boolean, default: false
  end
end

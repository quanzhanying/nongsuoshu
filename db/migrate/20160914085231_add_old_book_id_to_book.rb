class AddOldBookIdToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :old_book_id, :string
  end
end

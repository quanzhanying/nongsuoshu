class AddCategoryIdToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :category_id, :integer
  end
end

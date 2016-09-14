class ChangeBookContent < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :content, :text, limit: 16.megabytes - 1
  end
end

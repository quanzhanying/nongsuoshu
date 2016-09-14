class RenameSomeBookColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :preface, :introduction
  end
end

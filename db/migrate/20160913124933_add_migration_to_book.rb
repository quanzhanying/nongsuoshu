class AddMigrationToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :preface, :text
    add_column :books, :author_name, :string
    add_column :books, :published_date, :date
    add_column :books, :rating_from_ma, :float
    add_column :books, :rating_from_users, :float
    add_column :books, :pv, :integer
    add_column :books, :comments_count, :string
    add_column :books, :amazon_link, :string
  end
end

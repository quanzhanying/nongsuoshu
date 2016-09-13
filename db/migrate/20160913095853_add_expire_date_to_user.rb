class AddExpireDateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :expire_date, :date
  end
end

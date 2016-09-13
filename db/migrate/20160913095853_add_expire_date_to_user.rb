class AddExpireDateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :expired_at, :datetime
  end
end

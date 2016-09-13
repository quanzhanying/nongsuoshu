class AddIsPaidToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_paid, :boolean
  end
end

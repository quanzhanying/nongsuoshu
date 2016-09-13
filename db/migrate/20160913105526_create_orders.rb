class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :price
      t.integer :plan_id
      t.boolean :is_paid
      t.string :payment_method
      t.timestamps
    end
  end
end

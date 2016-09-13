class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.integer :plan_date
      t.timestamps
    end
  end
end

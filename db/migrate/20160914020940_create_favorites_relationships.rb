class CreateFavoritesRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites_relationships do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end

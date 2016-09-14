class ChangeDefaultForPv < ActiveRecord::Migration[5.0]
  def up
    change_column_default :books, :pv, 0
    change_column_default :books, :comments_count, 0
   end

  def down
    change_column_default :books, :pv, nil
    change_column_default :books, :comments_count, nil
  end
end

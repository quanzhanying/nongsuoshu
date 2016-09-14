class AddCoverImageLinkToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :cover_image_link, :string
  end
end

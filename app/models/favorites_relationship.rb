class FavoritesRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :book
end

# == Schema Information
#
# Table name: favorites_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

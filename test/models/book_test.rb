# == Schema Information
#
# Table name: books
#
#  id                :integer          not null, primary key
#  title             :string
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  aasm_state        :string           default("book_created")
#  category_id       :integer
#  introduction      :text
#  author_name       :string
#  published_date    :date
#  rating_from_ma    :float
#  rating_from_users :float
#  pv                :integer
#  comments_count    :string
#  amazon_link       :string
#  translater_name   :string
#  is_free           :boolean          default(FALSE)
#  is_editor_choice  :boolean          default(FALSE)
#  token             :string
#
# Indexes
#
#  index_books_on_aasm_state  (aasm_state)
#

#  translater_name   :string
#  is_free           :boolean          default(FALSE)
#  is_editor_choice  :boolean          default(FALSE)
#
# Indexes
#
#  index_books_on_aasm_state  (aasm_state)
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

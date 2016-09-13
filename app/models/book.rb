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
#  preface           :text
#  author_name       :string
#  published_date    :date
#  rating_from_ma    :float
#  rating_from_users :float
#  pv                :integer
#  comments_count    :string
#  amazon_link       :string
#  translater_name   :string
#
# Indexes
#
#  index_books_on_aasm_state  (aasm_state)
#

class Book < ApplicationRecord
  scope :recent, -> { order("created_at DESC") }

  validates :title, presence: true
  validates :content, presence: true
  belongs_to :category



  include AASM

  aasm do
    state :book_created, initial: true
    state :online
    state :offline

    event :publish do
      transitions from: :book_created, to: :online
    end

    event :hide do
      transitions from: :online, to: :offline
    end
  end
end

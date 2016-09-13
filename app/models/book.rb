# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
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

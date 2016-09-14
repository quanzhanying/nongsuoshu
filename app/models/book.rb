class Book < ApplicationRecord
  scope :recent, -> { order("created_at DESC") }
  scope :free, -> { where(is_free: true) }
  scope :editor_choice, -> { where(is_editor_choice: true) }

  validates :title, presence: true
  validates :content, presence: true
  belongs_to :category

  has_many :favorites_relationships
  has_many :book_fans, through: :favorites_relationships, source: :user

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

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
#  cover_image_link  :string
#  old_book_id       :string
#  subtitle          :string
#
# Indexes
#
#  index_books_on_aasm_state  (aasm_state)
#

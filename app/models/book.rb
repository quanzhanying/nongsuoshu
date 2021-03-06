require "csv"
class Book < ApplicationRecord
  scope :recent, -> { order("created_at DESC") }
  scope :free, -> { where(is_free: true) }
  scope :editor_choice, -> { where(is_editor_choice: true) }
  scope :recommend, -> (rand_num) { limit(4).offset(rand_num) }

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

  def self.import(file)
    arr_of_arrs = open_spreadsheet(file)
    arr_of_arrs.each do |row|
      pb_date =
        begin
          Date.parse(row[9])
        rescue
          nil
        end

      Book.create(

        old_book_id: row[0],
        created_at: row[1],
        updated_at: row[2],
        title: row[3],
        author_name: row[4],
        cover_image_link: row[5],
        introduction: row[6],
        content: row[7],
        is_free: Random.new(1),
        is_editor_choice: Random.new(1),
        subtitle: row[8],
        published_date: pb_date,
        rating_from_ma: row[11]

      )
    end
  end

  def can_display_for_user(user)
    can_flag = false
    if is_free
      can_flag =  true
    end

    if user.present? && user.valid_subscriber?
      can_flag =  true

    end

    can_flag
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then CSV.read(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def extract_amazon_link!
    doc = Nokogiri::HTML(content)

    if doc.css("a")[0].present? && doc.css("a")[0]["href"].include?("amazon")
      self.amazon_link = doc.css("a")[0]["href"]
      save
    end
  end
end

# == Schema Information
#
# Table name: books
#
#  id                :integer          not null, primary key
#  title             :string
#  content           :text(16777215)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  aasm_state        :string           default("book_created")
#  category_id       :integer
#  introduction      :text
#  author_name       :string
#  published_date    :date
#  rating_from_ma    :float
#  rating_from_users :float
#  pv                :integer          default(0)
#  comments_count    :string           default("0")
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

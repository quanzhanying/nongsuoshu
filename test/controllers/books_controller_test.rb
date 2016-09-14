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

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { content: @book.content, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { content: @book.content, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end

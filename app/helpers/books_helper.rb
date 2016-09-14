module BooksHelper
  def render_search_empty_result
    content_tag :div, class: "text-center" do
      content_tag :span, "暂时还没有包含这个关键词的浓缩书哦，请换一个关键词再试一下。"
    end
  end

  def render_highlight_title(book, query_string)
    excerpt_cont = excerpt(book.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

  def render_highlight_content(book, query_string)
    excerpt_cont = excerpt(book.content, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

  def render_book_title(book)
    link_to(book.title, book_path(book))
  end

  def render_book_cover(book, size = :front)
    link_to book_path(book), class: "thumbnail book-image" do
      render_book_cover_image_link(book, size)
    end
  end

  def render_book_cover_image_link(_book, size)
    case size
    when :thumb
      image_tag("/images/book1.jpg", size: "165x250")
    else
      image_tag("/images/book1.jpg", size: "330x500")
   end
  end
end

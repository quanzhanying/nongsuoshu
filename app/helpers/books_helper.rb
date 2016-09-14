module BooksHelper
  def render_search_empty_result
    content_tag :div, class: "text-center" do
      content_tag :span, "暂时还没有包含这个关键词的浓缩书哦，请换一个关键词再试一下。"
    end
  end

  def render_highlight_title(book, query_string)
    excerpt_cont = excerpt(book.title, query_string, radius: 5000)
    highlight(excerpt_cont, query_string, highlighter: '<mark style="background-color:yellow;"><strong>\1</strong></mark>')
  end

  def render_highlight_content(book, query_string)
    excerpt_cont = excerpt(book.content, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

  def render_book_title(book)
    link_to(book.title, book_path(book.token), class: "book-name")
  end

  def render_book_title_search(book_title, book)
    link_to(book_title, book_path(book.token))
  end

  def render_book_cover(book, size = :front)
    link_to book_path(book.token), class: "book-image" do
      render_book_cover_image_link(book, size)
    end
  end

  def render_book_cover_image_link(book, size)
    case size
    when :thumb
      image_tag(book.cover_image_link, size: "165x250")

    else
      image_tag(book.cover_image_link, size: "330x500")
   end
  end

  def render_book_introduction(book)
    truncate(sanitize(book.introduction), escape: false, length: 160)
  end

  def render_index_author_name(book)
    truncate(book.author_name, escape: false, length: 17)
  end

  def render_book_content_for_display(book)
    if book.can_display_for_user(current_user)
      book.content.html_safe
    else
      truncate(strip_tags(book.content), length: 250)
    end
  end

  def render_amazon_link(book)
    link_to("去亚马逊购买", book.amazon_link, class:"btn btn-default", target:"_blank")
  end

end

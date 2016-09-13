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
end

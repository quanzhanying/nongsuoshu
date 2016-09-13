module Admin::BooksHelper
  def render_book_status(book)
    case book.aasm_state
    when "book_created"
      content_tag(:span, "已创建", class: "label label-warning")
    when "online"
      content_tag(:span, "已上线", class: "label label-success")
    when "offline"
      content_tag(:span, "已下线", class: "label label-info")
    end
  end
end

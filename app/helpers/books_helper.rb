module BooksHelper
  def render_search_empty_result
    content_tag :div, class: "text-center" do
      content_tag :span, "暂时还没有包含这个关键词的浓缩书哦，请换一个关键词再试一下。"
    end
  end
end

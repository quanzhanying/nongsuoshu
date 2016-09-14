class WelcomeController < ApplicationController
  def help_term
    set_page_title("服务协议")
    render layout: "about_us"
  end

  def about_us
    set_page_title("关于我们")
    render layout: "about_us"
  end

  def contact_us
    set_page_title("联系我们")
    render layout: "about_us"
  end
end

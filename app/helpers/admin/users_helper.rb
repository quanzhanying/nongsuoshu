module Admin::UsersHelper
  def render_user_status(user)
    if user.paid?
      content_tag(:span, "已付费", class: "label label-success")
    else
      content_tag(:span, "未付费", class: "label label-warning")
    end
  end
end

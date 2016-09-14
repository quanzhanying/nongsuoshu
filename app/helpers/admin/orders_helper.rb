module Admin::OrdersHelper
  def render_order_status(order)
    case order.aasm_state
    when "unpaid"
      content_tag(:span, "Order Placed", class: "label label-warning")
    when "paid"
      content_tag(:span, "Paid", class: "label label-success")
    when "order_cancelled"
      content_tag(:span, "Order Cancelled", class: "label label-default")
    end
  end

  def render_order_empty_warning
    content_tag :div, class: "text-center" do
      content_tag :span, "暂时还没有订单"
    end
  end
end

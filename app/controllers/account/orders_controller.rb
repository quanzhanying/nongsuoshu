class Account::OrdersController < AccountController
  before_action :find_order, only: %i(show pay_with_wechat pay_with_alipay)
  layout "user", only:[:index]

  def show
    @order = Order.find_by_token(params[:id])
  end

  def index
    @orders = current_user.orders.recent
  end

  def pay_with_wechat
    @order.pay("wechat")

    current_user.add_subscription_date!(@order.plan.plan_date)

    flash[:notice] = "支付成功！"
    Notification.create(recipient: current_user, actor: current_user, action: "fund", notifiable: @order)
    redirect_to account_orders_path
  end

  def pay_with_alipay
    @order.pay("alipay")

    current_user.add_subscription_date!(@order.plan.plan_date)

    flash[:notice] = "支付成功！"
    Notification.create(recipient: current_user, actor: current_user, action: "fund", notifiable: @order)
    redirect_to account_orders_path
  end

  protected

  def find_order
    @order = Order.find_by_token(params[:id])
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i(create show)

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.user = current_user
    @order.plan = Plan.yearly_plan
    @order.price = @order.plan.price

    @order.save
    redirect_to account_order_path(@order.token)
  end
end

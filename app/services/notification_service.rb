class NotificationService
  # def initialize(order, user, project)
  def initialize(order, user)
    @order = order
    @user = user
  end



  def send_notification!
    Notification.create(recipient: @user, actor: @user, action: "fund", notifiable: @order)
  end
end

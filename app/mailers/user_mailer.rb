class UserMailer < ApplicationMailer
  default from: 'coffee@shop.com'

  def new_order(email, order_items, total)
    @order_items = order_items
    @total = total
    mail(to: email, subject: 'New Order')
    
  end

  def order_ready(email, order)
    order.ready!
    mail(to: email, subject: 'Order is ready')
  end

end

class OrdersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @order = current_order
  end

  def update
    @order = current_order
    
    if @order.update(order_params)
      cookies[:order_id] = ""
      UserMailer.new_order(@order.user.email, @order.order_items, @order.total).deliver_now
      UserMailer.order_ready(@order.user.email, @order).deliver_later(wait: 2.minute)
      flash[:notice] = "Order placed successfully"
      redirect_to root_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:total, :tax, :ship_to, :address1, :address2, :city, :state, :country, :zipcode, :user_id)
  end
end

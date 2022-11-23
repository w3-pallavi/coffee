module ApplicationHelper

  def current_order
    if !cookies[:order_id].blank?
      Order.find_by_id(cookies[:order_id])
    else
      Order.new
    end   
  end
end

class OrderItemsController < ApplicationController

  before_action :find_item, only: %w(update destroy)

  def create
    @order = current_order
    
    item_in_cart = @order.order_items.find_by(item_id: order_item_params[:item_id])
    if item_in_cart.present?
      item_in_cart.update(quantity: order_item_params[:quantity].to_i + item_in_cart.quantity)
    else
      @order_item = @order.order_items.new(order_item_params)
      @order_item.order_id = @order.id
      @order_item.save
    end
    cookies[:order_id] = @order.id
    respond_to do |format|
      format.html
      format.json {render json: {item: @order_item, order: @order}} 
    end
  end

  def update
    begin
      @order_item = @order_item.update(quantity: params[:order_item][:quantity])
    rescue StandardError => e
      redirect_to carts_path
    end
  end

  def destroy
    @order_item = @order_item.delete
    redirect_to carts_path
  end

  def find_item
    @order_item = current_order.order_items.find(params[:id])
  end

  private
  def order_item_params
    params.require(:order_item).permit(:item_id, :quantity)
  end
end

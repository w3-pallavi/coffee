class CartsController < ApplicationController

  def index
    @order_items = current_order&.order_items
    respond_to do |format|
      format.html
      format.json {render json: @order_items, status: :ok}
    end
  end
end

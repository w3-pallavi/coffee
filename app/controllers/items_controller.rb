class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item created successfully"
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json {render json: @item}
      end
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def index
    @items = Item.all
    @order_item = current_order.order_items.new
    respond_to do |format|
      format.html
      format.json {render json: @items}
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :tax)
  end
end

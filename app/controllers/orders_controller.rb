class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.create(order_params)
  end

  private

  def order_params
    params.require(:item).permit(:image, :name, :content, :category_id, :judgment_id, :shipping_cost_id, :shipping_day_id,:prefecture_id, :price)
  end
end
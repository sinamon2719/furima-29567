class ItemsController < ApplicationController
    before_action :move_to_index, except: [:index, :create]
    before_action :set_item, only: [:show, :edit, :update]
    before_action :authenticate_user!, except:[:index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
  params.require(:item).permit(:name, :content, :category_id, :judgment_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :price)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

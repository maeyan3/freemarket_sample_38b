class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
    @item.item_image_build
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :detail, :price, :size, :ship_burden, :ship_method, :ship_date, :quality, :prefecture_id, item_images_attributes: [:item_image_src] ).merge(status: 0, user_id: current_user.id)
  end
end

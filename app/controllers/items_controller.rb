class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @items = Item.all.includes(:item_images).order("created_at DESC")
  end

  def new
    @item        = Item.new
    @categories  = Category.all
    @sizes       = Size.all
    @brands      = Brand.all
    @prefectures = Prefecture.all
    4.times { @item.item_images.build }
  end

  def create
    @item = Item.new(item_params)
    render :new unless @item.save
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :detail, :price,
                                 :ship_burden,:ship_method, :ship_date,
                                 :quality, :prefecture_id, brand_ids: [],
                                 item_images_attributes: [:item_image_src],
                                 size_ids: [], category_ids: [] ).merge(status: 0, user_id: current_user.id)
  end
end

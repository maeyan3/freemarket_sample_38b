class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @items = Item.all.includes(:item_images).order("created_at DESC")
  end

  def new
    @item        = Item.new
    4.times { @item.item_images.build }
    @categories  = Category.all
    @sizes       = Size.all
    @brands      = Brand.all
    @prefectures = Prefecture.all
    respond_to do |format|
      format.html
      format.json { @categories = Category.where(parent_id: params[:parent_id]) }
    end
  end

  def show

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search_brand
    @brands = Brand.where("brand_name LIKE(?)", "#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
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

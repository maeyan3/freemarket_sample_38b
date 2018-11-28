class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @items = Item.all.includes(:item_images).page(params[:page]).per(20).order("created_at DESC")
  end
end

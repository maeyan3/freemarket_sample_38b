class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = Category.find(params[:id]).items.order("created_at DESC").page(params[:page]).per(20)
  end


end

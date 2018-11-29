class ListingsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id).page(params[:page]).per(7).order("created_at DESC")
  end
end

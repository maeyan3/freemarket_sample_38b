class OrdersController < ApplicationController
  include Card
  def index

  end

  def pay
  end


  def new
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    create_charge(@item.price)
    @order = Order.new
    @sales_money = SalesMoney.new

    redirect_to root_path
  end
end

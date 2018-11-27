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
    @order = Order.new(order_params)
    @sales_money = SalesMoney.new(get_money: @item.price * 0.9, money_limit: Date.today + 180, user_id: @item.user_id)
    @item.status = :pending_delivary

    if @sales_money.save && @order.save && @item.save
      redirect_to root_path
    else
      redirect_to new_item_order_path
    end
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
end

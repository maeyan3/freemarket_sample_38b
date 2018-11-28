class OrdersController < ApplicationController
  include Card
  before_action :set_item, only: [:new, :create]
  def index

  end

  def new
    @order = Order.new
  end

  def create
    create_charge(@item.price)
    @order = @item.orders.new(user_id: current_user.id)
    @sales_money = SalesMoney.new(get_money: @item.price * 0.9, money_limit: Date.today + 180, user_id: @item.user_id)
    @item.status = :pending_delivary

    if @sales_money.save && @order.save && @item.save
      redirect_to root_path
    else
      redirect_to new_item_order_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end


end

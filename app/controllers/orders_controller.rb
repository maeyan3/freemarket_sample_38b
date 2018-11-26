class OrdersController < ApplicationController
  include Card
  def index

  end

  def pay
  end


  def new
    @order = Order.new
  end

  def create
    create_charge
    @order = Order.new

    rescue Payjp::CardError
      redirect_to new_item_path

    redirect_to root_path
  end
end

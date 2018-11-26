class OrdersController < ApplicationController

  def index

  end

  def pay
  end


  def new
    @order = Order.new
  end

  def create
    customer_id = Credit.find_by(user_id: current_user.id).customer_id
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(
      amount: 5000,
      customer: customer_id,
      currency: 'jpy',
    )
    redirect_to root_path
  end
end

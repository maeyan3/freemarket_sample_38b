class OrdersController < ApplicationController

  def index

  end

  def pay
    Payjp.api_key = PAYJP_SECRET_KEY
    charge = Payjp::Charge.create(
    :amount => 2100,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end

  def new

  end

  def create

  end
end

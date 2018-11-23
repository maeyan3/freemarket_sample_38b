class OrdersController < ApplicationController

  def index

  end

  def pay
    Payjp.api_key = PAYJP_SECRET_KEY
    charge = Payjp::Charge.create(
    :amount => 3380,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
     flash[:notice] = '購入が完了しました。'
  end

  def new

  end

  def create

  end
end

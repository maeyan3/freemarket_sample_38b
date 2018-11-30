class SalesMoneysController < ApplicationController
  def index
  end

  def history
    @sales_moneys = current_user.sales_moneys.page(params[:page]).per(5)
  end
end

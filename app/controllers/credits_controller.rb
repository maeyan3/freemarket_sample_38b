class CreditsController < ApplicationController
  include Card
  def index
    @credit = current_user.credit
  end

  def new
    @credit = Credit.new
  end

  def create
    unless current_user.credit.present?
      @credit = Credit.new(user_id: current_user.id, customer_id: create_customer.id)
      if @credit.save
        render :index
      else
        render :new
      end
    else
      redirect_to credits_path
    end
  end

  def destroy
    @credit = Credit.find(params[:id])
    @credit.destroy
    redirect_to credits_path
  end

  private
  def credit_params
    params.require(:credit).permit(:credit_number,:limit_month,:limit_year,:security_code).merge(user_id: current_user.id)
  end
end

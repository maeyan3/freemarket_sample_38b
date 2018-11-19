class CreditsController < ApplicationController
  def index
    @credits = Credit.all
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    @credit.save
    redirect_to credits_path
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

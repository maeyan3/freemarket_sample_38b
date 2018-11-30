class CreditsController < ApplicationController
  include Card
  def index
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @credit = current_user.credits.first
    check_user
    @mycard = Payjp::Customer.retrieve(@credit.customer_id).cards.data[0] if @credit.present?
  end

  def new
    @credit = Credit.new
  end

  def create
    unless current_user.credits.present?
      @credit = current_user.credits.new(customer_id: create_customer.id)
      if @credit.save
        flash[:notice] = "登録しました"
        redirect_to credits_path
      else
        render :new
      end
    else
      flash[:notice] = "既にカードが登録されています"
      redirect_to credits_path
    end
  end

  def destroy
    @credit = Credit.find(params[:id])
    check_user
    @credit.destroy
    redirect_to credits_path
  end

  private
  def credit_params
    params.require(:credit).permit(:credit_number,:limit_month,:limit_year,:security_code).merge(user_id: current_user.id)
  end

  def check_user
    redirect_to root_path unless current_user.id == @credit.user_id
  end
end

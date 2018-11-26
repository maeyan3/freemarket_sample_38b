class CreditsController < ApplicationController
  def index
    @credits = Credit.all
  end

  def new
    @credit = Credit.new
  end

  def create
    Payjp.api_key = 'sk_test_ca3e7381a8b04f1c369683e7'

    #トークン作成
    number = params[:credit][:number]
    cvc = params[:credit][:cvc]
    exp_month = params[:credit][:month]
    exp_year = "20" + params[:credit][:year]
    token = Payjp::Token.create(
      {card: {
              number: number,
              cvc: cvc,
              exp_month: exp_month,
              exp_year: exp_year,
            }},
      'X-Payjp-Direct-Token-Generate': 'true'
    )
    # 顧客の作成
    customer = Payjp::Customer.create(card: token.id)
    #トークンとアプリのユーザーの紐付け
    @credit = Credit.new(user_id: current_user.id, customer_id: customer.id)
    @credit.save
    # # カードエラー発生時
    rescue Payjp::CardError
    render 'new'
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

class OrdersController < ApplicationController

  def index

  end

  # def pay
  #   Payjp.api_key = PAYJP_SECRET_KEY
  #   charge = Payjp::Charge.create(
  #   amount: 3380,
  #   card: params['payjp-token'],
  #   currency: 'jpy',
  # )
  # end


  # def payjp
  #   require 'payjp'
  #   Payjp.api_key = PAYJP_SECRET_KEY
  #   @user = User.find(current_user.id)
  #   @item.with_lock do
  #     if @item.buyer_id == nil && @item.status == "displayed"
  #       Payjp::Charge.create(
  #         :amount => @item.price,
  #         :card => params['payjp-token'],
  #         :currency => 'jpy',
  #       )
  #       @item.update!(buyer_id: @user.id)
  #       @item.update!(status: :trading)
  #       redirect_to  users_purchase_path
  #       flash[:notice] = '購入が完了しました。'
  #     else
  #       redirect_to :root
  #       flash[:alert] = '購入に失敗しました。申し訳ありません。入力中に出品停止されたか、他ユーザーに売却されました。'
  #     end
  #   end
  # end


class PaymentsController < ApplicationController


  def index
    #ここでのクレジットカード情報の表示の方法がわからない
    @payments = Payment.where(user_id: current_user.id)
  end

  def show
    #ここでのクレジットカード情報の表示の方法がわからない
  end

  def new
    @payment = Payment.new
  end

  def create
    Payjp.api_key = 'sk_test_ca3e7381a8b04f1c369683e7'

    #トークン作成
    token = Payjp::Token.create(
      card: {
        number: params[:number],
        cvc: params[:cvc],
        exp_month: params[:exp_month],
        exp_year: params[:exp_year],
        name: params[:name]
      },
      'X-Payjp-Direct-Token-Generate': 'true'
    )
    #顧客の作成
    customer = Payjp::Customer.create(card: token.id)

    #トークンとアプリのユーザーの紐付け
    @credit = Credit.new(customer_id: customer.id)
    binding.pry
    # カードエラー発生時
    rescue Payjp::CardError
    render 'new'
  end

  private
  def payment_params
    params.permit(:payment).permit(:user_id, :customer_id)
  end
end




  def new
  end

  def create

  end
end

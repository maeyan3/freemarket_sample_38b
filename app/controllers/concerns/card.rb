module Card
  def create_customer
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      year = "20" + params[:credit][:year]
      token = Payjp::Token.create({
      card: {
        number: params[:credit][:number],
        cvc: params[:credit][:cvc],
        exp_month: params[:credit][:month],
        exp_year: year,
        name: params[:credit][:name]
      }},
      {
        'X-Payjp-Direct-Token-Generate': 'true'
      }
    )
    customer = Payjp::Customer.create(card: token.id)
  end

  def create_charge(price)
    customer_id = Credit.find_by(user_id: current_user.id).customer_id
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: price,
      customer: customer_id,
      currency: 'jpy',
    )
  end
end

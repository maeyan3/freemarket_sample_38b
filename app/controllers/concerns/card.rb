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

end


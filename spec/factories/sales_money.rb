FactoryBot.define do

  factory :sales_money do
    user
    get_money Faker::Number.between(300, 9999999) * 0.9
    money_limit Date.today + 180

  end

end
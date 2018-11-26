FactoryBot.define do

  factory :user_detail do
    birth_day              Faker::Number.between(1, 12)
    birth_month               Faker::Number.between(1, 31)
    birth_year        Faker::Number.between(1900, 2018)
  end

end

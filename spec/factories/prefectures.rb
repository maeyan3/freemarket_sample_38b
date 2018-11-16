FactoryBot.define do

  factory :prefecture do
    prefecture_name Faker::Address.state
  end

end

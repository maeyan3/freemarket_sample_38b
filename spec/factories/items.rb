FactoryBot.define do

  factory :item do
    sequence(:id) {|n| n }
    item_name   Faker::Food.spice
    detail      Faker::Food.description
    price       Faker::Number.between(300, 9999999)
    ship_burden "送料込み(出品者負担)"
    ship_method "ゆうパック"
    ship_date   "1〜2日以内に発送"
    quality     "新品、未使用"
    status      :listing
    user
    prefecture
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    after(:build) do |item|
      3.times { item.categories << build(:category) }
      item.item_images << build(:item_image)
    end
  end
end

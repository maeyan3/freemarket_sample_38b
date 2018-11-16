FactoryBot.define do

  factory :item_image do
    sequence(:id) {|n| n }
    item_image_src  File.open("#{Rails.root}/public/images/test.jpeg")
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end

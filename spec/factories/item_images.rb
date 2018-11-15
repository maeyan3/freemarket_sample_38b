FactoryBot.define do

  factory :item_image do
    item_image_src  File.open("#{Rails.root}/public/images/test.jpeg")
  end

end

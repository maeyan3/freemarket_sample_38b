FactoryBot.define do

  factory category do
    category_name Faker::Book.genre
    parent_id
  end

end

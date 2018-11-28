FactoryBot.define do

  factory :user do
    nickname              "abe"
    email                 {Faker::Internet.free_email}
    profile               "hello"
    password              "00000000a"
    password_confirmation "00000000a"
    uid                   {Faker::Number.number(20)}
    provider              "facebook"
  end

end

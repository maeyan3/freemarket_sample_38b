FactoryBot.define do

  factory :address do
    first_name              "Manami"
    last_name               "Horie"
    last_name_reading        "ホリエ"
    first_name_reading       "マナミ"
    postal_code               "111-111"
    city                      "神戸市"
    block                     "1-1"
    user
    prefecture
  end

end

class Prefecture < ApplicationRecord
  has_many :items,     dependent: :destroy
  has_many :addresses, dependent: :destroy
end

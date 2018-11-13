class Brand < ApplicationRecord
  has_many :items_brands
  has_many :items, through: :items_brands
end

class Category < ApplicationRecord
  has_many :items_categories, dependent: :destroy
  has_many :items, through: :items_categories
end

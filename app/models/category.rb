class Category < ApplicationRecord
  has_many :items_categories
  has_many :categories, through: :items_categories
end

class Item < ApplicationRecord
  has_many :item_comments
  has_many :item_images
  has_many :items_categories
  has_many :categories, through: :items_categories
  has_many :items_sizes
  has_many :sizes, through: :items_sizes
  has_many :likes
  has_one  :order
  has_one  :items_brand
  has_one  :brand, through: :items_brand
  belongs_to :user
  belongs_to :prefecture
end

class Item < ApplicationRecord
  has_many :item_comments
  has_many :item_images
  has_many :items_categories
  has_many :categories, through: :items_categories
  has_many :items_sizes
  has_many :sizes, through: :items_sizes
  has_many :likes
  has_many :items_brands
  has_many :brands, through: :items_brands
  has_one  :order
  belongs_to :user
  belongs_to :prefecture

  accepts_nested_attributes_for :item_images
end

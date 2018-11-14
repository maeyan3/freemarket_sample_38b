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

  validates :item_name,    presence: true, length: { maximum: 40 }
  validates :detail,       presence: true, length: { maximum: 1000 }
  validates :ship_burden,  presence: true
  validates :ship_method,  presence: true
  validates :ship_date,    presence: true
  validates :quality,      presence: true
  validates :item_images,  presence: true
  validates :items_brands, presence: true
  validates :price,        presence: true, numericality: { greater_than_or_equal_to: 300,
                                                           less_than_or_equal_to: 9999999 }
  validates :status,       presence: true, numericality: { greater_than_or_equal_to: 0,
                                                           less_than_or_equal_to: 5 }
end



class Item < ApplicationRecord
  enum status: [:listing, :pending_delivary, :pending_recieve, :pending_evalute, :completed, :stop_listing]

  # has_many :item_comments,    dependent: :destroy
  has_many :item_images  ,    dependent: :destroy
  has_many :items_categories, dependent: :destroy
  has_many :categories, through: :items_categories
  has_many :items_sizes, dependent: :destroy
  has_many :sizes, through: :items_sizes
  # has_many :likes,        dependent: :destroy
  has_many :items_brands, dependent: :destroy
  has_many :brands, through: :items_brands
  has_many :orders
  has_many :sales_moneys
  belongs_to :user
  belongs_to :prefecture
  accepts_nested_attributes_for :item_images

  validates :item_name,    presence: true, length: { maximum: 40 }
  validates :detail,       presence: true, length: { maximum: 1000 }
  validates :ship_burden,  presence: true
  validates :ship_method,  presence: true
  validates :ship_date,    presence: true
  validates :quality,      presence: true
  validates :item_images,  presence: true, length: { maximum: 4 }
  validates :categories,   presence: true, length: { is: 3 }
  validates :sizes,        length: { is: 1 }, if: :sizes_present?
  validates :brands,       length: { maximum: 1 }
  validates :price,        presence: true, numericality: { greater_than_or_equal_to: 300,
                                                           less_than_or_equal_to: 9999999 }
  validates :status,       presence: true, inclusion: { in: Item.statuses.keys }


  scope :seller, ->(user_id,item_id) { where(user_id: user_id).where.not(id: item_id)}

  def sizes_present?
    self.sizes.present?
  end
end

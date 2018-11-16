class Size < ApplicationRecord
  has_many :items_sizes, dependent: :destroy
  has_many :items, through: :items_sizes
end

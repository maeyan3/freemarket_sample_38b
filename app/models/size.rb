class Size < ApplicationRecord
  has_many :items_sizes
  has_many :sizes, through: :items_sizes
end

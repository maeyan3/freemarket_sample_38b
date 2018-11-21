class Address < ApplicationRecord
  has_one :user_detail
  has_one :building
  has_one :address_tel
  belongs_to :user
  belongs_to :prefecture
end

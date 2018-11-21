class UserDetail < ApplicationRecord
  has_one :transfer
  belongs_to :user
  belongs_to :address
end

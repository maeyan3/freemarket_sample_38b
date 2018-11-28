class UserDetail < ApplicationRecord
  has_one :transfer
  belongs_to :user
  belongs_to :address

  validates :birth_year,  presence: true
  validates :birth_month,  presence: true
  validates :birth_day, presence: true

end

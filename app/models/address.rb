class Address < ApplicationRecord
  has_one :user_detail
  has_one :building
  has_one :address_tel
  belongs_to :user
  belongs_to :prefecture

  validates :user_id,  presence: true
  validates :prefecture,  presence: true
  validates :first_name,  presence: true, length: { maximum: 35 }
  validates :last_name,  presence: true, length: { maximum: 35 }
  validates :first_name_reading, presence: true, length: { maximum: 35 }
  validates :last_name_reading,  presence: true, length: { maximum: 35 }
  validates :postal_code,  presence: true, length: { is: 7 }
  validates :city,  presence: true, length: { maximum: 50 }
  validates :block,  presence: true, length: { maximum: 100 }

end


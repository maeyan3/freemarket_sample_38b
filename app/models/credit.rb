class Credit < ApplicationRecord
  belongs_to :user

  validates :credit_number,  presence: true, length: { in: 14..16 }, format: { with: /\A\d{14,16}\z/  }
  validates :limit_month,  presence: true
  validates :limit_year,    presence: true
  validates :security_code,      presence: true, length: { in: 3..4 }
end

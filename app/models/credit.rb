class Credit < ApplicationRecord
  belongs_to :user

  validates :credit_number,  presence: true, length: { is: 16 }
  validates :limit_month,  presence: true
  validates :limit_year,    presence: true
  validates :security_code,      presence: true, length: { in: 3..4 }
end

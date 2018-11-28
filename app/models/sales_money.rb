class SalesMoney < ApplicationRecord
  belongs_to :user

  validates :get_money,        presence: true
  validates :money_limit,        presence: true
end

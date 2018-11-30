class SalesMoney < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :get_money,        presence: true
  validates :money_limit,        presence: true
end

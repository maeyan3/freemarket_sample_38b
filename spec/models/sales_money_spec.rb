require 'rails_helper'

describe SalesMoney do
  describe '#create' do

    context '保存できる' do
      it 'get_moneyとmoney_limitとuserが存在すれば保存できる' do
        sales_money = build(:sales_money)
        expect(sales_money).to be_valid
      end
    end

    context '保存できない' do

      it 'get_moneyが無ければ保存できない' do
        sales_money = build(:sales_money, get_money: nil)
        sales_money.valid?
        expect(sales_money.errors[:get_money]).to include("can't be blank")
      end

      it 'money_limitが無ければ保存できない' do
        sales_money = build(:sales_money, money_limit: nil)
        sales_money.valid?
        expect(sales_money.errors[:money_limit]).to include("can't be blank")
      end


      it 'userが無ければ保存できない' do
        sales_money = build(:sales_money, user: nil)
        sales_money.valid?
        expect(sales_money.errors[:user]).to include('must exist')
      end

    end
  end
end
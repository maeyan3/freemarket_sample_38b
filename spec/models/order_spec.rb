require 'rails_helper'

describe Order do
  describe '#create' do

    context '保存できる' do
      it 'userとitemが存在すれば保存できる' do
        order = build(:order)
        expect(order).to be_valid
      end
    end

    context '保存できない' do

      it 'itemが無ければ保存できない' do
        order = build(:order, item: nil)
        order.valid?
        expect(order.errors[:item]).to include('must exist')
      end

      it 'userが無ければ保存できない' do
        order = build(:order, user: nil)
        order.valid?
        expect(order.errors[:user]).to include('must exist')
      end

    end
  end
end
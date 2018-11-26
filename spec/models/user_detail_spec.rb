require 'rails_helper'
  describe '#create' do

    let(:user) { create(:user) }
    let(:address) { create(:address, user_id: user.id) }
    context '保存できない' do
      it 'birth_yearが未選択なら保存できない' do
        user_detail = build(:user_detail, user_id: user.id, address_id: address.id, birth_year: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_year]).to include("can't be blank")
      end

      it 'birth_monthが未選択なら保存できない' do
        user_detail = build(:user_detail, user_id: user.id, address_id: address.id, birth_month: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_month]).to include("can't be blank")
      end

      it 'birth_dayが未選択なら保存できない' do
        user_detail = build(:user_detail, user_id: user.id, address_id: address.id, birth_day: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_day]).to include("can't be blank")
      end

    end

    context '保存できる' do
      it 'birth_yearが1900年で登録できる' do
        user_detail = build(:user_detail, user_id: user.id, address_id: address.id, birth_year: 1900)
        user_detail.valid?
        expect(user_detail).to be_valid
      end

      it 'birth_monthが1月で登録できる' do
        user_detail = build(:user_detail, user_id: user.id, address_id: address.id, birth_month: 1)
        user_detail.valid?
        expect(user_detail).to be_valid
      end

    end
  end

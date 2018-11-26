require 'rails_helper'
  describe '#create' do
    context '保存できない' do
      it 'birth_yearが存在しなければ保存できない' do
        user_detail = build(:user_detail, birth_year: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_year]).to include("can't be blank")
      end

      it 'birth_monthが存在しなければ保存できない' do
        user_detail = build(:user_detail, birth_month: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_month]).to include("can't be blank")
      end

      it 'birth_dayが存在しなければ保存できない' do
        user_detail = build(:user_detail, birth_day: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_day]).to include("can't be blank")
      end
    end

    context '保存できる' do
      it 'birth_yearが1900~2018年まで登録できる' do
        user_detail = build(:user_detail, birth_year: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_year]).to include("can't be blank")
      end

      it 'birth_monthが1~12月まで登録できる' do
        user_detail = build(:user_detail, birth_month: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_month]).to include("can't be blank")
      end

      it 'birth_dayが1~31日まで登録できる' do
        user_detail = build(:user_detail, birth_day: nil)
        user_detail.valid?
        expect(user_detail.errors[:birth_day]).to include("can't be blank")
      end

    end
  end

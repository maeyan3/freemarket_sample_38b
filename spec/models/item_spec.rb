require 'rails_helper'

describe Item do
  describe '#create' do
    context '保存できる' do
      it 'ユーザー,発送地域,商品名,説明,価格,送料負担,発送方法,発送日程,商品の状態,取引の状況,商品画像,カテゴリ3件があれば保存できる' do
        item = build(:item)
        expect(item).to be_valid
      end

      it 'サイズが2件あっても保存できる' do
        item = build(:item)
        2.times { item.sizes << build(:size) }
        expect(item).to be_valid
      end

      it 'ブランドが1件あっても保存できる' do
        item = build(:item)
        item.brands << build(:brand)
        expect(item).to be_valid
      end

      it '商品名が40文字で保存できる' do
        test_name = "a" * 40
        item = build(:item, item_name: test_name)
        expect(item).to be_valid
      end

      it '商品説明が1000文字で保存できる' do
        test_detail = "a" * 1000
        item = build(:item, detail: test_detail)
        expect(item).to be_valid
      end

      it '価格が300で登録できる' do
        item = build(:item, price: 300)
        expect(item).to be_valid
      end

      it '価格が9999999で保存できる' do
        item = build(:item, price: 9999999)
        expect(item).to be_valid
      end

      it '商品画像が4枚で保存できる' do
        item = build(:item)
        3.times { item.item_images << build(:item_image) }
        expect(item).to be_valid
      end

      it '取引の状態が0で保存できる' do
        item = build(:item, status: 0)
        expect(item).to be_valid
      end

      it '取引の状態が5で保存できる' do
        item = build(:item, status: 5)
        expect(item).to be_valid
      end
    end

    context '保存できない' do
    end
  end
end

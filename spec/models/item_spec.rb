require 'rails_helper'

describe Item do
  describe '#create' do

    context '保存できる' do
      it 'ユーザー,発送地域,商品名,説明,価格,送料負担,発送方法,発送日程,商品の状態,取引の状況,商品画像,カテゴリ3件があれば保存できる' do
        item = build(:item)
        expect(item).to be_valid
      end

      it 'サイズが1件あっても保存できる' do
        item = build(:item)
        item.sizes << build(:size)
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

      it '取引の状態がlistingで保存できる' do
        item = build(:item, status: :listing)
        expect(item).to be_valid
      end

      it '取引の状態がpending_delivaryで保存できる' do
        item = build(:item, status: :pending_delivary)
        expect(item).to be_valid
      end

      it '取引の状態がpending_recieveで保存できる' do
        item = build(:item, status: :pending_recieve)
        expect(item).to be_valid
      end

      it '取引の状態がpending_evaluteで保存できる' do
        item = build(:item, status: :pending_evalute)
        expect(item).to be_valid
      end

      it '取引の状態がcompletedで保存できる' do
        item = build(:item, status: :completed)
        expect(item).to be_valid
      end

      it '取引の状態がstop_listingで保存できる' do
        item = build(:item, status: :stop_listing)
        expect(item).to be_valid
      end
    end

    context '保存できない' do
      it 'ユーザーが存在しなければ保存できない' do
        item = build(:item, user: nil)
        item.valid?
        expect(item.errors[:user]).to include('must exist')
      end

      it '発送元地域が存在しなければ保存できない' do
        item = build(:item, prefecture: nil)
        item.valid?
        expect(item.errors[:prefecture]).to include('must exist')
      end

      it '商品名が無ければ保存できない' do
        item = build(:item, item_name: nil)
        item.valid?
        expect(item.errors[:item_name]).to include("can't be blank")
      end

      it '商品説明が無ければ保存できない' do
        item = build(:item, detail: nil)
        item.valid?
        expect(item.errors[:detail]).to include("can't be blank")
      end

      it '送料の負担者が無ければ保存できない' do
        item = build(:item, ship_burden: nil)
        item.valid?
        expect(item.errors[:ship_burden]).to include("can't be blank")
      end

      it '発送方法が無ければ保存できない' do
        item = build(:item, ship_method: nil)
        item.valid?
        expect(item.errors[:ship_method]).to include("can't be blank")
      end

      it '発送日程が無ければ保存できない' do
        item = build(:item, ship_date: nil)
        item.valid?
        expect(item.errors[:ship_date]).to include("can't be blank")
      end

      it '商品の状態が無ければ保存できない' do
        item = build(:item, quality: nil)
        item.valid?
        expect(item.errors[:quality]).to include("can't be blank")
      end

      it '商品画像が無ければ保存できない' do
        item = build(:item)
        item.item_images = []
        item.valid?
        expect(item.errors[:item_images]).to include("can't be blank")
      end

      it 'カテゴリが無ければ保存できない' do
        item = build(:item)
        item.categories = []
        item.valid?
        expect(item.errors[:categories]).to include("can't be blank")
      end

      it '取引の状態が無ければ保存できない' do
        item = build(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to include("can't be blank")
      end

      it '商品名が41文字では保存できない' do
        test_name = "a" * 41
        item = build(:item, item_name: test_name)
        item.valid?
        expect(item.errors[:item_name]).to include('is too long (maximum is 40 characters)')
      end

      it '商品説明が1001文字では保存できない' do
        test_detail = "a" * 1001
        item = build(:item, detail: test_detail)
        item.valid?
        expect(item.errors[:detail]).to include('is too long (maximum is 1000 characters)')
      end

      it '価格が299では保存できない' do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it '価格が10000000では保存できない' do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it '画像が5枚では保存できない' do
        item = build(:item)
        4.times { item.item_images << build(:item_image) }
        item.valid?
        expect(item.errors[:item_images]).to include('is too long (maximum is 4 characters)')
      end

      it 'カテゴリが4つでは保存できない' do
        item = build(:item)
        item.categories << build(:category)
        item.valid?
        expect(item.errors[:categories]).to include('is the wrong length (should be 3 characters)')
      end

      it 'カテゴリが2つでは保存できない' do
        item = build(:item)
        item.categories.delete(item.categories[2])
        item.valid?
        expect(item.errors[:categories]).to include('is the wrong length (should be 3 characters)')
      end

      it 'サイズが2つでは保存できない' do
        item = build(:item)
        2.times { item.sizes << build(:size) }
        item.valid?
        expect(item.errors[:sizes]).to include('is the wrong length (should be 1 character)')
      end

      it 'ブランドが2つでは保存できない' do
        item = build(:item)
        2.times { item.brands << build(:brand) }
        item.valid?
        expect(item.errors[:brands]).to include('is too long (maximum is 1 character)')
      end

    end
  end
end

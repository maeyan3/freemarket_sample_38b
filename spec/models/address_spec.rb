require 'rails_helper'

describe Address do
  describe '#create' do

    context '保存できない' do

      it 'user_idが存在しなければ保存できない' do
        address = build(:address, user_id: nil)
        address.valid?
        expect(address.errors[:user_id]).to include("can't be blank")
      end

      it 'first_nameが存在しなければ保存できない' do
        address = build(:address, first_name: nil)
        address.valid?
        expect(address.errors[:first_name]).to include("can't be blank")
      end

      it 'last_nameが存在しなければ保存できない' do
        address = build(:address, last_name: nil)
        address.valid?
        expect(address.errors[:last_name]).to include("can't be blank")
      end

      it 'first_name_readingが存在しなければ保存できない' do
        address = build(:address, first_name_reading: nil)
        address.valid?
        expect(address.errors[:first_name_reading]).to include("can't be blank")
      end

      it 'last_name_readingが存在しなければ保存できない' do
        address = build(:address, last_name_reading: nil)
        address.valid?
        expect(address.errors[:last_name_reading]).to include("can't be blank")
      end

       it 'postal_codeが存在しなければ保存できない' do
        address = build(:address, postal_code: nil)
        address.valid?
        expect(address.errors[:postal_code]).to include("can't be blank")
      end

      it 'cityが存在しなければ保存できない' do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("can't be blank")
      end

      it 'blockが存在しなければ保存できない' do
        address = build(:address, block: nil)
        address.valid?
        expect(address.errors[:block]).to include("can't be blank")
      end

       it 'last_nameが36文字では保存できない' do
        test_name = "a" * 36
        address = build(:address, last_name: test_name)
        address.valid?
        expect(address.errors[:last_name]).to include('is too long (maximum is 35 characters)')

      end

       it 'first_nameが36文字では保存できない' do
        test_name = "a" * 36
        address = build(:address, last_name: test_name)
        address.valid?
        expect(address.errors[:last_name]).to include('is too long (maximum is 35 characters)')
      end


       it 'prefectureがなければ保存できない' do
        address = build(:address, prefecture: nil)
        address.valid?
        expect(address.errors[:prefecture]).to include("can't be blank")
      end

    end

      context '保存できる' do

      it 'last_nameが35文字で保存できる' do
        test_lastname = "a" * 35
        address = build(:address, last_name: test_lastname)
        expect(address).to be_valid

      end

      it 'first_nameが35文字で保存できる' do
        test_firstname = "a" * 35
        address = build(:address, first_name: test_firstname)
        expect(address).to be_valid
      end

      it 'last_name_readingが35文字で保存できる' do
        test_lastname = "a" * 35
        address = build(:address, last_name_reading: test_lastname)
        expect(address).to be_valid

      end

       it 'first_name_readingが35文字で保存できる' do
        test_lastname = "a" * 35
        address = build(:address, first_name_reading: test_lastname)
        expect(address).to be_valid

      end

       it 'postal_codeが6文字で保存できる' do
        test_postal_code = "a" * 6
        address = build(:address, postal_code: test_postal_code)
        expect(address).to be_valid
      end

       it 'cityが50文字で保存できる' do
        test_city = "a" * 50
        address = build(:address, city: test_city)
        expect(address).to be_valid
      end

       it 'blockが100文字で保存できる' do
        test_block = "a" * 100
        address = build(:address, block: test_block)
        expect(address).to be_valid
      end



    end
  end
end

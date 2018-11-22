
require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, email, profile, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end



    it "is invalid without a nickname" do
     user = build(:user, nickname: nil)
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end




    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end




    it "パスワードに英字が入ってないと登録できない" do
      user = build(:user, password: "12345678", password_confirmation: "12345678")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end


    it "パスワードが英字大のみで登録できる" do
      user = build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      expect(user.save).to be_truthy
    end

    it "パスワードが英字小のみで登録できる" do
      user = build(:user, password: "ABCDEFG", password_confirmation: "ABCDEFG")
      expect(user.save).to be_truthy
    end




    it "is invalid with a nickname that has more than 20 characters " do
      user = build(:user, nickname: "abcdeabcdeabcdeabcdea")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "is invalid with a email that has less than 3 characters " do
      user = build(:user, email: "a@a")
      user.valid?
      expect(user.errors[:email][0]).to include("is too short")
    end

    it "is invalid with a email that has more than 255 characters " do
      user = build(:user, email: "112345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678@gmail.com")
      user.valid?
      expect(user.errors[:email][0]).to include("is too long")
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "is invalid with a password that has more than 128 characters " do
      user = build(:user, password: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890a")
      user.valid?
      expect(user.errors[:password][0]).to include("is too long")
    end

    it "プロフィールがなくても保存できる" do
      user = build(:user, profile: nil)
      expect(user).to be_valid
    end

    it "プロフィールが1000文字で保存できる" do
      test_profile = "a" * 1000
      user = build(:user, profile: test_profile)
      expect(user).to be_valid
    end

    it "プロフィールが1001文字で保存できない" do
      test_profile = "a" * 1001
      user = build(:user, profile: test_profile)
      user.valid?
      expect(user.errors[:profile][0]).to include("is too long")
    end

  end
end

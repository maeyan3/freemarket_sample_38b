class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { in: 1..20 }
  validates :email, presence: true, length: { in: 4..255 }
  validates :profile, length: { maximum: 1000 }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z]{1,})[a-z\d]{6,128}+\z/i }, unless: -> { validation_context == :edit_profile }
end

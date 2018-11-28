class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_one :user_detail

  has_many :credits
  has_many :sales_moneys
  has_many :orders

  validates :nickname, presence: true, length: { in: 1..20 }
  validates :email, presence: true, length: { in: 4..255 }
  validates :profile, length: { maximum: 1000 }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z]{1,})[a-z\d]{6,128}+\z/i }, unless: -> { validation_context == :edit_profile }
  validates :uid, uniqueness: { scope: [:provider] }

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(nickname: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(nickname: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  # 通常サインアップ時のuidに入れる文字列
  def self.create_unique_string
    SecureRandom.uuid
  end

end

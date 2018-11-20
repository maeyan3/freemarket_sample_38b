class Profile < ApplicationRecord
  belongs_to :user

  validates :profile_text, presence: true, length: { in: 1..1000 }
end

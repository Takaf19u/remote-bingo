class Group < ApplicationRecord
  has_secure_password
  belongs_to :user

  validates :groupName, presence: true, uniqueness: true, length: { minimum: 5 } 
  validates :password_digest, presence: true, length: { in: 6..20 } 
end

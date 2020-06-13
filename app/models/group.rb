class Group < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :cards
  has_many :users, through: :cards

  validates :groupName, presence: true, uniqueness: true, length: { minimum: 5 } 
  validates :password_digest, presence: true, length: { minimum: 6 }
end

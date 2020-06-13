class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :cards
  has_many :groups, through: :cards

  validates :name, uniqueness: true, length: { minimum: 3 }
  validates :name,:email, :encrypted_password, presence: true
end

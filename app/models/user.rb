class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_furigana, presence: true
  validates :last_name_furigana, presence: true
  validates :birthday, presence: true


  has_many :products
  has_many :purchase_records
end

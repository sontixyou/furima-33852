class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name_kanji, presence: true
  validates :name_hiragana, presence: true
  validates :name_katakana, presence: true
  validates :birthday, presence: true
end

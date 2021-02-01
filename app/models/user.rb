class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '漢字、ひらがな、カタカナのみ使用してください'}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '漢字、ひらがな、カタカナのみ使用してください'}
    validates :first_name_furigana, format: {with: /\A[ァ-ヶー－]+\z/, message: 'カタカナのみ使用してください'}
    validates :last_name_furigana, format: {with: /\A[ァ-ヶー－]+\z/, message: 'カタカナのみ使用してください'}
    validates :birthday
  end

  has_many :products
  has_many :purchase_records
end

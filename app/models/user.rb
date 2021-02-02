class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: { case_sensitive: true, message: 'はもう登録されています' }, format: { with: VALID_EMAIL_REGEX, message: '@マークがありません' }
    
    with_options format: {with: PASSWORD_REGEX, message: '半角英数字のみ使用してください'} do
      validates :password 
    end
    
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '漢字、ひらがな、カタカナのみ使用してください'} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: 'カタカナのみ使用してください'} do
      validates :first_name_furigana
      validates :last_name_furigana
    end
    
  end

  has_many :products
  has_many :purchase_records
end
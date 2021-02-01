require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      @user.first_name = "太郎"
      @user.last_name = "鈴木"
      @user.first_name_furigana = "タロウ"
      @user.last_name_furigana = "スズキ"
      @user.birthday.published_at[0] = "1990"
      @user.birthday.start_date[1] = 1
      @user.birthday.start_date[2] = 19 
    end
    
    
    
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  end
end

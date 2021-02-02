require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    
    context 'ユーザー登録ができる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name, last_name, first_name_furigana, presence: true
      validates :last_name_furigana, birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end  
    
    context 'ユーザー登録ができない場合' do
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

      it "birthdayが空では登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "first_nameが空では登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空では登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_name_furiganaが空では登録できないこと" do
        @user.first_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it "last_name_furiganaが空では登録できないこと" do
        @user.last_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.first_name = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナのみ使用してください")
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.last_name = "Suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナのみ使用してください")
      end

      it "first_name_furiganaが全角（カタカナ）以外は登録できない" do
        @user.first_name_furigana = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana カタカナのみ使用してください")
      end

      it "last_name_furiganaが全角（カタカナ）以外は登録できない" do
        @user.last_name_furigana = "Suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana カタカナのみ使用してください")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英字のみでは登録できない" do
        @user.password = "aaaaaaa"
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字のみ使用してください")
      end

      it "passwordが数字のみでは登録できない" do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字のみ使用してください")
      end

      it "passwordが全角英数字のみでは登録できない" do
        @user.password = "１１１１ａａ"
        @user.password_confirmation = "１１１１ａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字のみ使用してください")
      end
    end
  end
    
    
  
end

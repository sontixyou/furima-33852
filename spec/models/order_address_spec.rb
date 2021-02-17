require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品配送先の保存' do
    before do
      @user = FactoryBot.build(:user, id: 1)
      @item = FactoryBot.build(:item, id: 1)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end
    context '商品を購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingの値が空でも保存できること' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end
    context '商品を購入できない場合' do
      it 'addressが空だと保存できないこと' do
        @order_address.address_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'addressが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.address_number = '11111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid. Include hyphen(-)')
      end
      it 'addressが全角数字だと保存できないこと' do
        @order_address.address_number = '１１１-１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid. Include hyphen(-)')
      end

      it 'addressが全角文字では登録できないこと' do
        @order_address.address_number = 'あああ-ああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid. Include hyphen(-)')
      end

      it 'addressが半角英数混合では登録できないこと' do
        @order_address.address_number = '111-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid. Include hyphen(-)')
      end

      it 'addressが半角英語だけでは登録できないこと' do
        @order_address.address_number = 'aaa-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid. Include hyphen(-)')
      end

      it 'addressが1111-1111では登録できないこと' do
        @order_address.address_number = '1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid. Include hyphen(-)')
      end

      it 'addressが111-11111では登録できないこと' do
        @order_address.address_number = '1111-11111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid. Include hyphen(-)')
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityは空でも保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberは空では保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'telが空だと保存できないこと' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが全角数字だと保存できないこと' do
        @order_address.tel = '１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is only numbers')
      end

      it 'telが全角文字では登録できないこと' do
        @order_address.tel = 'あああああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is only numbers')
      end

      it 'telが半角英数混合では登録できないこと' do
        @order_address.tel = 'aaa11111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is only numbers')
      end

      it 'telが半角英語だけでは登録できないこと' do
        @order_address.tel = 'aaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is only numbers')
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品を出品できる場合' do
    it '全ての項目が存在していれば商品を出品できること' do
      expect(@item).to be_valid
    end
  end
  context '商品を出品できない場合' do
    it '出品画像が空だと商品を出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Image translation missing: en.activerecord.errors.models.item.attributes.image.presence')
    end
    it '商品名が空だと商品を出品できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '商品の説明が空だと商品を出品できない' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end
    it '商品の詳細　カテゴリが空だと商品を出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の詳細　状態が空だと商品を出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it '配送について　配送料の負担が空だと商品を出品できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end
    it '配送について　発送元の地域が空だと商品を出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '配送について　発送までの日数が空だと商品を出品できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
    end
    it '販売価格が空だと商品を出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が299円だと商品を出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '販売価格が100000000円だと商品を出品できない' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格が全角文字では登録できないこと' do
      @item.price = 'ああああ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格が半角英数混合では登録できないこと' do
      @item.price = 'aa11a'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格が半角英語だけでは登録できないこと' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end

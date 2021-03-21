require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品できるとき' do
    it '全て正しく入力されていると出品できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できないとき' do
    it 'ログインしていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it '商品画像がついていないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が記入されていないと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が記入されていないと出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーが選択されていないと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーが初期状態だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品状態が選択されていないと出品できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '商品状態が初期状態だと出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it '配送料負担が選択されていないと出品できない' do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    it '配送料負担が初期状態だと出品できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage must be other than 1')
    end
    it '発送元地域が選択されていないと出品できない' do
      @item.sender_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sender area can't be blank")
    end
    it '発送元地域が初期状態だと出品できない' do
      @item.sender_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sender area must be other than 1')
    end
    it '発送までの日数が選択されていないと出品できない' do
      @item.required_time_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Required time can't be blank")
    end
    it '発送までの日数が初期状態だと出品できない' do
      @item.required_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Required time must be other than 1')
    end
    it '販売価格が記入されていないと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が￥300未満だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '販売価格が￥10,000,000以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格が全角数字だと出品できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格が英数混合では登録できない' do
      @item.price = '1000en'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格が半角英語のみでは登録できない' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end

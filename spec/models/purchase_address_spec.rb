require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.3
    end

    context '購入情報が保存される場合' do
      it '全て入力されていれば保存される' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空欄でも保存される' do
        @purchase_address.building_name = ""
        expect(@purchase_address).to be_valid
      end
    end
    context '購入情報が保存されない場合' do
      it 'ユーザーが紐づいていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報が紐づいていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空欄だと保存できない' do
        @purchase_address.postcode = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it '都道府県が選択されていないと保存できない' do
        @purchase_address.prefecture_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture is not a number')
      end
      it '都道府県が初期状態だと保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空欄だと保存できない' do
        @purchase_address.municipality = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空欄だと保存できない' do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空欄だと保存できない' do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上では登録できない' do
        @purchase_address.phone_number = "080123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it '電話番号に数字以外が含まれている場合は登録できない' do
        @purchase_address.phone_number = "0801234567a"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'トークンがないと保存できない' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

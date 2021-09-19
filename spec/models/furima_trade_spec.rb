require 'rails_helper'

RSpec.describe FurimaTrade, type: :model do
  before do
    @furima_trade = FactoryBot.build(:furima_trade)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it '必要な項目が存在すれば登録できる' do
        expect(@furima_trade).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号が空では保存できない' do
        @furima_trade.postal_code = ''
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県が「---」では保存できない' do
        @furima_trade.prefecture_id = 0
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Prefecture must be other than 0"
      end
      it '市町村が空では保存できない' do
        @furima_trade.city = ''
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では保存できない' do
        @furima_trade.address = ''
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空では保存できない' do
        @furima_trade.phone_number = ''
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'userが紐づいていないと保存できない' do
        @furima_trade.user_id = nil
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていないと保存できない' do
        @furima_trade.item_id = nil
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Item can't be blank"
      end
#      it 'カード番号が空では保存できない' do
#        @furima_trade.token[:number] = ''
      it 'カード情報(全て)が空では保存できない' do
        @furima_trade.token = ''
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号がハイフンを含まない数字では保存できない' do
        @furima_trade.postal_code = '1234567'
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Postal code is invalid"
      end
      it '電話番号が10桁以下では保存できない' do
        @furima_trade.phone_number = '666'
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
      end
      it '電話番号が11桁以上では保存できない' do
        @furima_trade.phone_number = '01234567890123456789'
        @furima_trade.valid?
        expect(@furima_trade.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
    end
  end
end

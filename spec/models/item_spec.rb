require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規出品' do
    context '出品できる場合' do
      it "必要項目が全て存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品きない場合' do
      it '画像ファイルがないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it 'item_category_idが「---」では登録できない' do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category must be other than 0"
      end
      it 'item_sales_status_idが「---」では登録できない' do
        @item.item_sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Item sales status must be other than 0"
      end
      it 'item_fee_shipping_status_idが「---」では登録できない' do
        @item.item_fee_shipping_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Item fee shipping status must be other than 0"
      end
      it 'item_prefecture_idが「---」では登録できない' do
        @item.item_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Item prefecture must be other than 0"
      end
      it 'item_scheduled_delivery_idが「---」では登録できない' do
        @item.item_scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Item scheduled delivery must be other than 0"
      end
      it 'item_priceが300未満では登録できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be greater than or equal to 300"
      end
      it 'item_priceが9999999を超えていると登録できない' do
        @item.item_price = 100000000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be less than or equal to 9999999"
      end
      it 'item_priceが半角数字以外だと登録できない' do
        @item.item_price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end
    end
  end
end
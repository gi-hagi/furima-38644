require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能の保存' do
    context "商品が保存できる場合" do
      it '必須項目が存在すれば登録することができる' do
        expect(@item).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'conceptが空では登録できない' do
        @item.concept = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it 'categoryが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'situationが空では登録できない' do
        @item.situation_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it 'delivery_priceが空では登録できない' do
        @item.delivery_price_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price can't be blank")
      end
      it 'areaが空では登録できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'delivery_priceが空では登録できない' do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end

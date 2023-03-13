require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '配送先情報の保存' do
    context "配送先が保存できる場合" do
      it '必須項目が存在すれば保存することができる' do
        expect(@order).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it '郵便番号が空では保存できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空では保存できない' do
        @order.area_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空では保存できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できない' do
        @order.phone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end
    end
  end
end

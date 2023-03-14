require 'rails_helper'

RSpec.describe ManagementForm, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @management_form = FactoryBot.build(:management_form, item_id: item.id, user_id: user.id)
    end

    context "配送先が保存できる場合" do
      it '必須項目が存在すれば保存することができる' do
        expect(@management_form).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it '郵便番号が空では保存できない' do
        @management_form.post_code = nil
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空では保存できない' do
        @management_form.area_id = nil
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空では保存できない' do
        @management_form.city = nil
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @management_form.address = nil
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できない' do
        @management_form.phone = nil
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Phone can't be blank")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @management_form.area_id = ''
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Area can't be blank")
      end
    end
  end
end

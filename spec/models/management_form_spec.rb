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
      it 'buildが空でも保存できる' do
        @management_form.build = nil
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
        @management_form.area_id = '1'
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Area can't be blank")
      end
      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @management_form.post_code = '1234567'
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Post code is invalid")
      end
      it '電話番号が半角数字以外が含まれている場合は購入できない' do
        @management_form.phone = 'ああああああ'
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Phone is invalid")
      end
      it '9桁以下だと購入できない' do
        @management_form.phone = '123456'
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Phone is invalid")
      end
      it '12桁以上だと登録できない' do
        @management_form.phone = '1234567890123'
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Phone is invalid")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @management_form.user_id = nil
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ投稿できない' do
        @management_form.item_id = nil
        @management_form.valid?
        expect(@management_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

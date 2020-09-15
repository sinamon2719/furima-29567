require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
    end

    describe '実装の条件' do
      context '出品情報' do
        it '商品名が必須であること' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'カテゴリーの情報が必須であること' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態についての情報が必須であること' do
          @item.judgment_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Judgment can't be blank")
        end
        it '配送料の負担についての情報が必須であること' do
          @item.shipping_cost_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
        end
        it '発送元の地域についての情報が必須であること' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '発送までの日数についての情報が必須であること' do
          @item.shipping_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end
        it '価格についての情報が必須であること' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格の範囲が、¥300~¥9,999,999の間であること' do
        end
        it '販売価格は半角数字のみ入力可能であること' do
          @item.price = '１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
      end
    end
  end
end

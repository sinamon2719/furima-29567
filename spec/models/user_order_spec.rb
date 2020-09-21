require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  describe UserOrder do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user.id)
      @user_order = FactoryBot.build(:user_order,user_id: @user.id,item_id:@item.id)
    end

    describe '実装の条件' do
      context '購入情報がある場合' do
        it '必須項目が間違いなく入力されていれば進める' do
          expect(@user_order).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @user_order.building_name = nil
          expect(@user_order).to be_valid
        end
      end
      context '購入情報がない場合' do
        it '郵便番号が必須であること' do
          @user_order.post_code = ''
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Post code can't be blank")
        end
        it '都道府県が必須であること' do
          @user_order.prefecture_id = ''
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '1が選択された場合は、出品できないこと（発送地域）' do
          @user_order.prefecture_id = '1'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it '番地の情報が必須であること' do
          @user_order.city = ''
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("City can't be blank")
        end
        it '市区町村についての情報が必須であること' do
          @user_order.address = ''
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号が必須であること' do
          @user_order.phone_number = ''
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
        end
        it '郵便番号にはハイフンが必要であること' do
          @user_order.post_code = '5630027'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it '電話番号にはハイフンは不要であること' do
          @user_order.phone_number = "080-6174-9908"
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Phone number unnecessary hyphen(-)")
        end
        it '電話番号は11桁以内であること' do
          @user_order.phone_number = '123123123123123'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Phone number is out of setting range")
        end
        
        it 'トークンの情報が必須であること' do
          @user_order.token = ''
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Token can't be blank")
        end
        
      end
    end
  end
end

require 'rails_helper'
RSpec.describe User, type: :model do
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '実装の条件' do
    context "ユーザーが保存できる場合" do
      it "必須項目が間違いなく入力されていれば進める" do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー情報' do
      it "ニックネームが必須であること" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが必須であること" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end
      
      it "パスワードが必須であること" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは6文字以上であること" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字混合であること" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "パスワードは確認用を含めて2回入力すること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '本人情報確認' do
      it "ユーザー本名が、名字と名前が必須であること（名字）" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "ユーザー本名が、名字と名前が必須であること（名前）" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること(名字)" do
        @user.family_name = "abb"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること(名前)" do
        @user.first_name = "abb"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること(名字）" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること（名前）" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "生年月日が必須であること" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
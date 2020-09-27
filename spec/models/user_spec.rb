require 'rails_helper'
RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe '実装の条件' do
      context 'ユーザーが保存できる場合' do
        it '必須項目が間違いなく入力されていれば進める' do
          expect(@user).to be_valid
        end
      end
      context 'ユーザー情報' do
        it 'ニックネームが必須であること' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end
        it 'メールアドレスが必須であること' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it 'emailが重複している時、保存できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        end
        it 'emailに@が含まれていない時、保存できない' do
          @user.email = 'okigeisai2012'
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        end
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは6文字以上であること' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードは半角英数字混合であること' do
        @user.password = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'パスワードは確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end

    context '本人情報確認' do
      it 'ユーザー本名が、名字と名前が必須であること（名字）' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'ユーザー本名が、名字と名前が必須であること（名前）' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること(名字)' do
        @user.family_name = 'abb'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字全角文字を使用してください")
      end
      it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること(名前)' do
        @user.first_name = 'abb'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前全角文字を使用してください")
      end

      it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること(名字）' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end

      it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること（名前）' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること(名字）' do
        @user.family_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)全角カタカナのみで入力して下さい")
      end
      it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること(名前）' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)全角カタカナのみで入力して下さい")
      end
      it '生年月日が必須であること' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end

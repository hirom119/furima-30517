require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '会員登録'do
    context '会員登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationとfirst_nameと  last_nameとfirst_name_kanaとlast_name_kanaとbirthdayが存在すれば登録  できる"do
      expect(@user).to be_valid
      end
    end
    context '会員登録がうまくいかない時'do
      it "nicknameが空では登録できない"do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない"do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない"do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと " do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは６文字以上であれば登録できる"do
        @user.password = "00000a"
        expect(@user).to be_valid
      end
        it "passwordは半角英数字であれば登録できる"do
        @user.password ='00000a'
        expect(@user).to be_valid
      end
        it "first_nameが空だと登録できない"do
        @user.first_name = ""
        @user.valid?

        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_name_kanaが空だと登録できない"do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_nameが空だと登録できない"do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_name_kanaが空だと登録できない"do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      
      it "first_name_kanaはカタカナでの入力でないと登録できない"do
        @user.last_name_kana= "あいうえお"
        @user.valid?
       
        expect(@user.errors.full_messages).to include ("Last name kana 全角カタカナのみで入力して下さい")
      end

      it "last_name_kanaはカタカナでの入力でないと登録できない"do
        @user.last_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
      end

      it "birthdayがあれば登録できる"do
        @user.birthday = ""
        @user.valid?
        expect("birthday can't be blank")
      end
    end
  end
end 
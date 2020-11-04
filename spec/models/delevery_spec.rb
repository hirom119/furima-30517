require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
 before do
  @user = FactoryBot.create(:user)
  @item = FactoryBot.create(:item,user_id:@user.id)
  @order = FactoryBot.build(:item_order,user_id:@user.id,item_id:@item.id)
end

  describe '商品購入'do
      context '商品購入がうまくいく時' do
        it "郵便番号と都道府県と市区町村と番地と電話番号と建物名とtokenが存在すれば購入できる"do
        expect(@order).to be_valid
        end
        it "郵便番号が空では購入できない"do
          @order.post_code = ''
          @order.valid?
          expect(@order.errors.full_messages).to include  ("Post code can't be blank")
      end
       it "都道府県が1では購入できない"do
         @order.prefecture_id = 1
         @order.valid?
         expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空では空では購入できない"do
          @order.city = ""
          @order.valid?
          expect(@order.errors.full_messages).to include  ("City can't be blank")
      end
      it "番地が空では購入できない"do
          @order.address = ""
          @order.valid?
          expect(@order.errors.full_messages).to include  ("Address can't be blank")
      end
      it "電話番号が空では登録できない"do
          @order.phone_number = nil
          @order.valid?
          expect(@order.errors.full_messages).to include  ("Phone number can't be blank")
      end
      it "郵便番号は７桁でないと購入できない"do
        @order.post_code = "123-1234"
        expect(@order).to be_valid
      end
      it "郵便番号にハイフンが含まれないと購入できない"do
        @order.post_code = "123-1234"
        expect(@order).to be_valid
      end
      it "電話番号は11桁出ないと登録できない"do
        @order.phone_number ="12345678910"
        expect(@order).to be_valid
      end
      it "tokenが空では購入できない"do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include  ("Token can't be blank")
      end
        it "電話番号は数字のみでないと購入できない"do
          @order.phone_number = "123456-78910"
          @order.valid?
          expect(@order.errors.full_messages).to include  ("Phone number is invalid")
      end
    end
  end
  end 
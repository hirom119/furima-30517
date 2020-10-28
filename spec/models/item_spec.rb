require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
  @item = FactoryBot.build(:item)
end
  describe '商品出品'do
    context '商品出品がうまくいくとき' do
      it "imageとnameとdescription_idとcategoryとstatus_idとshippng_charge_idとprefecture_idと days_idとpriceがあれば保存できる"do
        expect(@item).to be_valid
      end
    end
    context "商品出品がうまくいかないとき"do
      it "imageが空では保存できない"do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では保存できない"do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
        it "商品の説明が空では保存できない"do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが空では保存できない"do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank")
      end
      it "商品の状態が空では保存できない"do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "発送元の地域が空だと保存できない"do
        @item.prefecture_id = ''
        @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "配送料の負担が空ではでき保存ない"do
        @item.shipping_charge_id = ''
        @item.valid?

        expect(@item.errors.full_messages).to include("Shipping charge is not a number", "Shipping charge can't be blank")
      end
      it "発送までの日数が空では保存できない"do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "価格が空では保存できない"do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
        end
      it "カテゴリーが１だと保存できない"do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が１だと保存できない"do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "発送元の地域が１だと保存できない"do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "配送料の負担が１だと保存できない"do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it "発送までの日数が１だと保存できない"do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it "価格が300円以上でないと保存できない"do
        @item.price = 222
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it "価格が9999999以下でないと保存できない"do
      @item.price =111111111111111
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end

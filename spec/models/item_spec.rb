require 'rails_helper'

RSpec.describe "itemモデル", type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/hero.jpg')
    end

    it "画像は1枚必須であること(ActiveStorageを使用すること)" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.explain = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態についての情報が必須であること" do
      @item.state_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
    end
    it " 発送元の地域についての情報が必須であること" do
      @item.place_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Place can't be blank")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.dispatch_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Dispatch can't be blank")
    end
    it "価格についての情報が必須であること" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が、¥300以上であること" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end
    it "価格の範囲が、¥9,999,999以下であること" do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
    it "販売価格は半角数字のみ入力可能であること" do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
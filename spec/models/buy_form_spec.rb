require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @buy_form = FactoryBot.build(:buy_form)
    end

    it "クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと" do
      @buy_form.token = ""
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Token can't be blank")
    end
    it "配送先の情報として、郵便番号が必須であること" do
      @buy_form.postal = ""
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Postal is invalid")
    end
    it "配送先の情報として、都道府県が必須であること" do
      @buy_form.prefecture_id = ""
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "配送先の情報として、市区町村が必須であること" do
      @buy_form.city = ""
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("City can't be blank")
    end
    it "配送先の情報として、番地が必須であること" do
      @buy_form.address = ""
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Address can't be blank")
    end
    it "配送先の情報として、電話番号が必須であること" do
      @buy_form.tel = ""
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Tel can't be blank")
    end
    it "郵便番号にはハイフンが必要であること（123-4567となる）" do
      @buy_form.postal = "12345678"
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Postal is invalid")
    end
    it "電話番号にはハイフンは不要で、11桁以内であること" do
      @buy_form.tel = "123456789012"
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Tel is invalid")
    end
  end
end
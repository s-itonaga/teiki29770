require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe  do
    before do
      @customer = FactoryBot.build(:customer)
    end

    it "nameとname_kana、phone_numberが存在すれば登録できること" do
      expect(@customer).to be_valid
    end

    it "nameが空では登録できないこと" do
      @customer.name = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("お客様名を入力してください")
    end

    it "name_kanaが空では登録できないこと" do
      @customer.name_kana = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("お客様名カナを入力してください", "お客様名カナは全角カタカナで入力してください")
    end

    it "name_kanaがカタカナでなければ登録できないこと" do
      @customer.name_kana = "ヤマダタロウ"
      @customer.valid?
      expect(@customer.errors.full_messages).to include("お客様名カナは全角カタカナで入力してください")
    end

    it "phone_numberが空では登録できないこと" do
      @customer.phone_number = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("電話番号を入力してください", "電話番号は数値で入力してください")
    end

    it "phone_numberはハイフンなし、11桁以下でなければ登録できないこと(ハイフンあり)" do
      @customer.phone_number = "090-000-111"
      @customer.valid?
      expect(@customer.errors.full_messages).to include("電話番号は数値で入力してください")
    end

    it "phone_numberはハイフンなし、11桁以下でなければ登録できないこと(12桁以上)" do
      @customer.phone_number = "090000001111"
      @customer.valid?
      expect(@customer.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end

  end
end

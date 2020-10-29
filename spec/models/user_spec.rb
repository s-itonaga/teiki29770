require 'rails_helper'

RSpec.describe User, type: :model do
  describe  do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("店舗名を入力してください")
    end

    it "codeが空では登録できないこと" do
      @user.code = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("日販IDを入力してください", "日販IDは半角数字8文字で入力してください")
    end

    it "codeは半角数字のみの入力(全角で入力)" do
      @user.code = "１２３４５６７８"
      @user.valid?
      expect(@user.errors.full_messages).to include("日販IDは半角数字8文字で入力してください")
    end

    it "codeは半角数字のみの入力(半角英字で入力)" do
      @user.code = "abcdefgh"
      @user.valid?
      expect(@user.errors.full_messages).to include("日販IDは半角数字8文字で入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

      # bundle exec rspec spec/models/user_spec.rb
      # @user.valid?
      # @user.errors
      # @user.errors.full_messages
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報確認' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "ニックネームが空では登録できない" do
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end    
    it "メールアドレスが重複していると登録できない" do
      another_user = FactoryBot.build(:user)
      another_user.save
      @user.email = another_user.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end    
    it "メールアドレスは@を含む必要があること" do
      @user.email = Faker::Name.name
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end   
    it "パスワードは6文字未満だと登録できない" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end    
    it "パスワードは全角だと登録できない" do
      @user.password = "パスワああああアド"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end    
    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）" do
      #テスト内容
    end
  end
end
require 'rails_helper'
  RSpec.describe User do
    before do
      @user = FactoryBot.build(:user)
    end



  describe 'ユーザー新規登録' do

    context '新規登録がうまくいかないとき' do


    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank", "Email is invalid")
    end

    it "emailが一意性でないと登録できない" do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@がついていないと登録できない" do
      @user.email = "saopenicloud.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank","Password Include both letters and numbers")
    end

    it "passwordが6文字以上でなければ登録できない" do
      @user.password = "12ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合でないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank","Password confirmation Include both letters and numbers")
    end

    it "passwordは確認用を含めて2回入力しなければ登録できない" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank","Password confirmation Include both letters and numbers")
    end

    it "family_nameが空だと登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name Full-width characters")
    end

    it "family_nameが全角でないと登録できない" do
      @user.family_name = "ito"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name Full-width characters")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが全角でないと登録できない" do
      @user.first_name = "saori"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name  Full-width characters")
    end

     it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank","Family name kana Full-width katakana characters")
     end

    it "family_name_kanaが全角カタカナ以外だと登録できない" do
      @user.family_name_kana = "ito"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
    end

    it "first_name_kanaが空だと登録できない"do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    it "first_name_kanaが全角カタカナ以外だと登録できない" do
      @user.first_name_kana = "saori"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    it "birth_dayが空だと登録できない" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    end


  context '新規登録がうまくいくとき' do

    it "nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できる" do
      expect(@user).to be_valid

     
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end
  end
  end
end

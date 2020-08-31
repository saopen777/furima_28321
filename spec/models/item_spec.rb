require 'rails_helper'
  RSpec.describe Item do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/mouseover-zoomup-image.jpg')
    end


  describe '商品出品機能' do

    context '出品機能がうまくいかないとき' do


    it "nameが空だとうまくいかない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "imageが空だとうまくいかない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end


    it "descriptionが空だとうまくいかない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "priceが300円から9999999円でなければ登録できない" do
      @item.price = "123"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが9999999円以上だと登録できない" do
      @item.price = "99999999"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが空だとうまくいかない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "burdenが選択されていないと登録できない" do
      @item.burden_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end

    it "categoryが選択されていないと登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "conditionが選択されていないと登録できない" do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "daysが選択されていないと登録できない" do
      @item.days_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Days must be other than 1")
    end

    it "prefectureが選択されていないと登録できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    end


  context '商品出品機能がうまくいくとき' do

    it "全ての要素が存在すれば登録できる" do
      expect(@item).to be_valid
    end

    it "priceが300円から9999999円であれば登録できる" do
      @item.price = "1234"
      expect(@item).to be_valid
    end

  end
  
  end
end
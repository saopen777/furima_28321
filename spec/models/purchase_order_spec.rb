require 'rails_helper'
  RSpec.describe PurchaseOrder, type: :model do
    before do
      @purchase = FactoryBot.build(:purchase_order)
    end


    describe '商品購入機能' do

      context '出品購入がうまくいかないとき' do


        it "postal_codeが空だとうまくいかない" do
          @purchase.postal_code = nil
          @purchase.valid?
        end

        it "postal_codeにハイフンがないとうまくいかない" do
          @purchase.postal_code = "5647777"
          @purchase.valid?
        end

        it "prefectureが選択されていないと登録できない" do
          @purchase.prefecture_id = "1"
          @purchase.valid?
        end

        it "cityが空だとうまくいかない" do
          @purchase.city = nil
          @purchase.valid?
        end

        it "addressが空だとうまくいかない" do
          @purchase.address = nil
          @purchase.valid?
        end

        it "phone_numberが空だとうまくいかない" do
          @purchase.phone_number = nil
          @purchase.valid?
        end

        it "phone_numberにハイフンがあるとうまくいかない" do
          @purchase.phone_number = "090-3979-7777"
          @purchase.valid?
        end

        it "phone_numberが11桁以上だとうまくいかない" do
          @purchase.phone_number = "09039797777"
          @purchase.valid?
        end

        it "クレジットカード情報が空だとだとうまくいかない" do
          @purchase.token = nil
          @purchase.valid?
        end

        it "クレジットカード情報が正しくないとうまくいかない" do
          @purchase.token = "4242"
          @purchase.valid?
        end
      end

      context '商品出品機能がうまくいくとき' do

        it "全ての要素が存在すれば登録できる" do
          expect(@purchase).to be_valid
        end

        it "postal_codeにハイフンがあれば登録できる" do
          @purchase.postal_code = "564-0004"
          expect(@purchase).to be_valid
        end

        it "phone_numberにハイフンがないと登録できる" do
          @purchase.phone_number = "09039797777"
          expect(@purchase).to be_valid
        end

        it "phone_numberが11桁以内で登録できる" do
          @purchase.phone_number = "09039797777"
          expect(@purchase).to be_valid
        end

        it "クレジットカード情報が正しいと登録できる" do
          @purchase.token = "4242424242424242"
          expect(@purchase).to be_valid
        end

      end
    end
  end


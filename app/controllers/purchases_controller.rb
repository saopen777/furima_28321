class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update]

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseOrder.new
  end


  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseOrder.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def corrent_user
    @purchase = current_user.purchase.find_by(id: params[:id])
      unless @purchase
        redirect_to root_url
      end
  end

  private

  def purchase_params
    params.permit(:item_id, :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end

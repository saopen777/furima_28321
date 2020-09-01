class ItemsController < ApplicationController
  before_action :authenticate_with_http_digest

  def index
#    @image = Image.all
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
    redirect_to root_path
    else
      render 'new'
    end
  end


  # def done
  #   @item = Product.find(params[:id])
  #   @item.update( item_id: current_user.id )
  # end


  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :burden_id, :days_id, :prefecture_id, :category_id, :condition_id, :content, :image).merge(user_id: current_user.id)
  end
end
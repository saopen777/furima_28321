class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_with_http_digest

  def index
    @items = Item.all.order("created_at DESC")

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

  def edit
  end

  def update
    if @item.update(item_params)
      @item.valid?
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end



  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :burden_id, :days_id, :prefecture_id, :category_id, :condition_id, :content, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
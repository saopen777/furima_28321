class ItemsController < ApplicationController
  before_action :authenticate_with_http_digest

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def items_params
    params.require(:items).permit(:user, :name, :price, description, :burden, :days, :prefecture, :category, :condition, :image).merge(user_id: current_user.id)
  end
  
end

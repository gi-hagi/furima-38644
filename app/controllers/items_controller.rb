class ItemsController < ApplicationController
  before_action :item_action, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at ASC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_action
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :situation_id, :delivery_price_id, :area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end

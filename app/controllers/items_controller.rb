class ItemsController < ApplicationController
  before_action :item_action, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :log_edit, only: [:edit, :update, :destroy]

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

  def edit
    if @item.management.present?
      redirect_to root_path
    end
  end

  def update
    if @item.management.present?
      redirect_to root_path
    else
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end
  end

  def destroy
    if @item.management.present?
      redirect_to root_path
    else
      item = Item.find(params[:id])
      item.destroy
      redirect_to root_path
    end
  end


  private

  def item_action
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :situation_id, :delivery_price_id, :area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def log_edit
    redirect_to root_path unless current_user == @item.user 
  end
end

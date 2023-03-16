class ManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :management_action, only: [:index, :create]
  before_action :log_edit, only: [:index, :create]

  def index
    @management_form = ManagementForm.new
    if @item.management.present?
      redirect_to root_path
    end
  end

  def create
    @management_form = ManagementForm.new(order_params)
    if @management_form.valid?
      pay_item
      @management_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def management_action
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:management_form).permit(:post_code, :area_id, :city, :address, :build, :phone, :management_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def log_edit
    redirect_to root_path if current_user == @item.user 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], 
      currency: 'jpy' 
    )
  end
end

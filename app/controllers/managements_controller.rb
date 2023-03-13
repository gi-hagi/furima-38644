class ManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :management_action, only: [:index, :create]

  def index
    @management_form = ManagementForm.new
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

  def pay_item
    Payjp.api_key = "sk_test_161c07ef4808f311fc9e7f46"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], 
      currency: 'jpy' 
    )
  end
end

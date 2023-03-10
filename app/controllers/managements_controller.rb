class ManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :management_action, only: [:index, :create]

  def index
    @management_form = ManagementForm.new
  end

  def create
    @management_form = ManagementForm.new(order_params)
    if @management_form.valid?
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
    params.require(:management_form).permit(:post_code, :area_id, :city, :address, :build, :phone, :management_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

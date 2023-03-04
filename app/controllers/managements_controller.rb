class ManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @management_form = ManagementForm.new
    @item = Item.find(params[:item_id])
  end

  def create
  end
end

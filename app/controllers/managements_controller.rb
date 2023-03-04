class ManagementsController < ApplicationController
  def index
    @management_form = ManagementForm.new
    @item = Item.find(params[:item_id])
  end

  def create
  end
end

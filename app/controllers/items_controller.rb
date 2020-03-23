class ItemsController < ApplicationController

  def new
    @item = Item.new
  end
  def create
    Item.create(item_params)
  end
  def edit
    @item = Item.find(params[:id])
  end
  def show
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy
  end
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :brand, :prefecture_code_id, :category_id,  :item_condition_id, :preparation_day_id, :postage_payer_id, :user_id, images_attributes: [:src, :item_id, :created_at, :update_at]).merge(user_id: current_user.id)
  end
end

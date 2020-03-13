class ItemsController < ApplicationController

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    # redirect_to item_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :prefecture_code, :item_images_id, :category_id, :brand_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :size_id, :seller_id, :buyer_id)
  end



end

class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
  end
  def new
    @item = Item.new
    @item.images.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    @item = Item.find(params[:id])
  end
  def show
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_update_params)
  end
  def destroy
    @item.destroy
    redirect_to root_path
  end 
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :prefecture_code, :item_images_id, :category_id, :brand_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :size_id, :user_id, images_attributes: [:src, :_destroy, :id])
  end
  def set_item
    @item = Item.find(params[:id])
  end
end

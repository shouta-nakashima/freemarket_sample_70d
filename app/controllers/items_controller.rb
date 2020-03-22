class ItemsController < ApplicationController

  def new
    @item = Item.new
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end
  def get_category_children
    @category_children = Category.find_by(name: params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  def create
    Item.create(item_params)
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
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
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy
  end
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price,:prefecture_code,:item_images_id,:category_id,:brand_id,:item_condition_id,:preparation_day_id,:postage_payer_id,:size_id,:seller_id,:buyer_id)
  end
end

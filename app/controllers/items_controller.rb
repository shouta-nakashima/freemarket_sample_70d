class ItemsController < ApplicationController
  before_action :set_item, except: [:index,:new,:create,:destroy,:get_category_children,:get_category_grandchildren]
  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
    @images = Image.all
  end
  def new
    @item = Item.new
    @images = @item.images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
    # Item.create(item_params)
    # if @item.save
    #   redirect_to root_path
    # else
    #   render new_items_path
    end
  end
  def edit
    @item = Item.find(params[:id])
    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def show
    @item = Item.find(params[:id])
    @image = @item.images.includes(:item)
    @condition = ItemCondition.find(@item.item_condition_id)
    @postage_payer = PostagePayer.find(@item.postage_payer_id)
    @preparation_day = PreparationDay.find(@item.preparation_day_id)
    @category = Category.find(@item.category_id)
    @prefecture_code = PrefectureCode.find(@item.prefecture_code_id)
    @seller = User.find(@item.seller_id)
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :brand, :prefecture_code_id, :category_id,  :item_condition_id, :preparation_day_id, :postage_payer_id, :seller_id, images_attributes: [:src, :item_id, :created_at, :update_at]).merge(seller_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end
end

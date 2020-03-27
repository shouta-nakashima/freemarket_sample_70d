class HomeController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)

    @items = Item.all.order("id DESC")
  end

  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end
end

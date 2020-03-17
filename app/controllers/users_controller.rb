class UsersController < ApplicationController
  # allメソッドではidが無いと怒られるのでとりあえずfindメソッド配列１指定
  def index
    @item = Item.find(1)
  end

  def new
  end

  def creat
    
  end

  def desroy
  end

  def show
    @user = User.find(params[:id])
  end

end


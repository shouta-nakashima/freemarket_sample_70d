class UsersController < ApplicationController

  def index
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


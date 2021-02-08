class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, only: [:edit]
  def index
    @items =Item.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end  
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:format])
    item.update(item_params)
    render :edit
  end
  private
  def item_params
    params.require(:item).permit(:title, :detail, :price, :category_id, :condition_id, :delivery_day_id, :delivery_fee_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:format])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end
end
 
class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index
  def index
    @item = Item.find(params[:item_id])
    
    @order_address = OrderAddress.new
  end

 
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end       
  end

  private
  def order_address_params
    params.require(:order_address).permit(:address_number, :prefecture_id, :city, :house_number, :building, :tel).merge(user_id: @item.user_id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id || item.order.present?
      redirect_to root_path
    end
  end  
end
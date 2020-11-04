class OrdersController < ApplicationController
  before_action :set_order, only: [:index,:create]
  def index
    @order = ItemOrder.new
    if current_user == @order.user_id
      redirect_to user_session_path
    end
    if user_signed_in?
      if current_user.id == @item.user_id 
        redirect_to root_path
      end
    end
    if @item.order !=nil
      redirect_to root_path
    end
  end
  
  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private
  def order_params
    params.permit(:post_code,:token,:prefecture_id,:city,:address,:building,:phone_number,:item_id).merge(user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
       amount: @item.price,
       card: order_params[:token],
       currency: 'jpy'
    )
  end
  def set_order
    @item = Item.find(params[:item_id])
  end
end

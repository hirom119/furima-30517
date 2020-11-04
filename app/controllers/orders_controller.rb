class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index,:create]
  def index
      if current_user.id == @item.user_id ||@item.order !=nil
        redirect_to root_path
      end
      @order = ItemOrder.new
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

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if (current_user == @item.user) || ((current_user != @item.user) && TradingManagement.find_by(item_id: @item.id))
      return redirect_to root_path
    end
    @furima_trade = FurimaTrade.new
  end

  def create
    @furima_trade = FurimaTrade.new(order_params)
    if @furima_trade.valid?
      pay_item
      @furima_trade.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:furima_trade).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
    .merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.item_price,
    card: order_params[:token],
    currency: 'jpy'
  )
  end

end

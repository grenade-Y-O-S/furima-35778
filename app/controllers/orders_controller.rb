class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @furima_trade = FurimaTrade.new
  end

  def create
    @furima_trade = FurimaTrade.new(order_params)
    if @furima_trade.valid?
      @furima_trade.save
      return redirect_to root_path
    else
      render item_orders_path
    end
  end

  private

  def order_params
    params.require(:furima_trade).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end

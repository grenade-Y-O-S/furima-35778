class FurimaTrade
  include ActiveModel::Model
#  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :building
    validates :phone_number
    validates :user_id
    validates :item_id
#    validates :token
  end

  def save
    order = Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
    trading_management = TradingManagement.create(user_id: current_user.id, item_id: item.id)
  end
end
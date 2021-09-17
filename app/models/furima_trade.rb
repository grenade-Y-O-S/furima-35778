class FurimaTrade
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, length: { in: 10..11 }, format: { with: /\d+/ }
    validates :user_id
    validates :item_id
  end

  def save
    trading_management = TradingManagement.create(user_id: user_id, item_id: item_id)
    order = Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, trading_management_id: trading_management.id)
  end
end
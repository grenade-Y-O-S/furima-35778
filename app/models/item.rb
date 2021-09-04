class Item < ApplicationRecord
devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_fee_shipping_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
    validates :item_price, numericality: {:greater_than_or_equal_to 300, :less_than_or_equal_to 9999999}
  end
end

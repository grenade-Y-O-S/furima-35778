class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :item_category
  belongs_to :item_fee_shipping_status
  belongs_to :item_prefecture
  belongs_to :item_sales_status
  belongs_to :item_scheduled_delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    with_options numericality: { other_than: 0 } do
      validates :item_category_id
      validates :item_sales_status_id
      validates :item_fee_shipping_status_id
      validates :item_prefecture_id
      validates :item_scheduled_delivery_id
    end
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                           format: { with: /\A[0-9]+\z/ }
  end
end


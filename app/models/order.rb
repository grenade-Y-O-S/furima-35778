class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :user
  belongs_to :item
  belongs_to :trading_management

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :building
    validates :phone_number
  end
end

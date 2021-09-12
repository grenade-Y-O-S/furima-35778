FactoryBot.define do
  factory :item do
    item_name { '文庫本' }
    item_info { '説明文' }
    item_category_id { rand(1..10) }
    item_sales_status_id { rand(1..6) }
    item_fee_shipping_status_id { rand(1..2) }
    prefecture_id { rand(1..47) }
    item_scheduled_delivery_id { rand(1..3) }
    item_price { rand(3..500) * 100 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

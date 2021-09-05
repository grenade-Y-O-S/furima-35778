class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :item_name,                    null: false
      t.text        :item_info,                    null: false
      t.string      :item_category_id,             null: false
      t.string      :item_sales_status_id,         null: false
      t.string      :item_fee_shipping_status_id,  null: false
      t.string      :item_prefecture_id,           null: false
      t.string      :item_scheduled_delivery_id,   null: false
      t.integer     :item_price,                   null: false
      t.integer     :item_dealing_status,          null: false
      t.timestamps
    end
  end
end

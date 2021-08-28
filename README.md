# README

## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| user_name       | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | string | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column                    | Type          | Options                        |
| ------------------------- | ------------- | ------------------------------ |
| item_image                | ActiveStrage  | null: false                    |
| item_name                 | string        | null: false                    |
| item_info                 | text          | null: false                    |
| item_category             | string        | null: false                    |
| item_sales_status         | string        | null: false                    |
| item_fee_shipping_status  | string        | null: false                    |
| item_prefecture           | string        | null: false                    |
| item_scheduled_delivery   | string        | null: false                    |
| item_price                | integer       | null: false                    |
| user_id                   | references    | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one    :orders

## ordersテーブル

| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| card_number    | ActiveStrage | null: false                    |
| card_exp_month | string       | null: false                    |
| card_exp_year  | text         | null: false                    |
| card_cvc       | string       | null: false                    |
| postal_code    | string       | null: false                    |
| prefecture     | string       | null: false                    |
| city           | string       | null: false                    |
| addresses      | string       | null: false                    |
| building       | integer      | null: false                    |
| phone_number   | integer      | null: false                    |
| user_id        | references   | null: false, foreign_key: true |
| item_id        | references   | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :orders

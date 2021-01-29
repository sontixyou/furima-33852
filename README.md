# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_furigana | string | null: false |
| last_name_furigana  | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :products, through: :purchase_records

## products テーブル

| Column         | Type          | Options     |
| -------------- | ------------- | ----------- |
| title          | string        | null: false |
| detail         | text          | null: false |
| condition_id   | integer       | null: false |
| deliver_fee_id | integer       | null: false |
| area_id        | integer       | null: false |
| deliver_day_id | integer       | null: false |
| category_id    | integer       | null: false |
| price          | numeric       | null: false |
| stock          | boolean       | null: false |
| user           | reference     | null: false |

### Association

- belong_to :users
- has_one :trade
- has_many :users, through: :purchase_records

## trade テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| address-number   | numeric | null: false |
| prefecture       | string  | null: false |
| city             | string  | null: false |
| house-number     | string  | null: false |
| tel              | numeric | null: false |

### Association

- belongs_to :products

## ｐurchase_records テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| user_id   | integer | null: false |
| title_id  | integer | null: false |

### Association

- belongs_to :users
- belongs_to :products

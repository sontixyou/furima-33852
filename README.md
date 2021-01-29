# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_furigana | string | null: false               |
| last_name_furigana  | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :products
- has_many :purchase_records

## products テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| title          | string        | null: false                    |
| detail         | text          | null: false                    |
| condition_id   | integer       | null: false                    |
| deliver_fee_id | integer       | null: false                    |
| prefecture_id  | integer       | null: false                    |
| deliver_day_id | integer       | null: false                    |
| category_id    | integer       | null: false                    |
| price          | integer       | null: false                    |
| stock          | boolean       | null: false                    |
| user           | references    | null: false, foreign_key: true |

### Association

- belong_to :users
- has_one :trades
- has_one :purchase_records

## trades テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| address-number | numeric | null: false |
| prefecture_id  | integer | null: false |
| city           | string  | null: false |
| house-number   | string  | null: false |
| building       | string  | null: false |
| tel            | numeric | null: false |

### Association

- belongs_to :products
- has_one :purchase_records

## ｐurchase_records テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user_id   | references | null: false |
| title_id  | references | null: false |

### Association

- belongs_to :users
- belongs_to :products
- belongs_to :trades

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

- has_many :items
- has_many :order

## items テーブル

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
| user           | references    | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| address_number | string  | null: false |
| prefecture_id  | integer | null: false |
| city           | string  | null: false |
| house_number   | string  | null: false |
| building       | string  |             |
| tel            | string  | null: false |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

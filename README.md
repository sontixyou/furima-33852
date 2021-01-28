# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name-kanji    | string | null: false |
| name-hiragana | string | null: false |
| name-katakana | string | null: false |
| birthday      | date   | null: false |

### Association

- has_many :products

## products テーブル

| Column      | Type          | Options     |
| ----------- | ------------- | ----------- |
| title       | string        | null: false |
| detail      | text          | null: false |
| condition   | string        | null: false |
| deliver-fee | numeric       | null: false |
| area        | string        | null: false |
| deliver-day | date          | null: false |
| price       | numeric       | null: false |
| stock       | boolean       | null: false |
| image       | ActiveStorage | null: false |
| user        | reference     | null: false |

### Association

- belong_to :users
- has_one :trade

## trade テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| cash-card-number | numeric | null: false |
| address-number   | numeric | null: false |
| prefecture       | string  | null: false |
| city             | string  | null: false |
| house-number     | string  | null: false |
| tel              | numeric | null: false |

### Association

- belongs_to :products
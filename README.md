# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |
### Association

- has_many :user_items
- has_many :items



## items テーブル

| Column          | Type      | Options                       |
| --------        | ------    | -----------                   |
| name            | string    | null: false                   |
| price           | integer   | null: false                   |
| content         | text      | null: false                   |
| shipping_cost   | integer   | null: false                   |
| shipping_days   | integer   | null: false                   |
| prefecture      | integer   | null: false,                  |
| judgment        | integer   | null: false                   |
| category        | integer   | null: false                   |
| user_id         | integer   | null: false,foreign_key: true |
### Association

- has_many :user_items
- belongs_to :user



## user_items テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | integer    | null: false, foreign_key: true |
| item_id   | integer    | null: false, foreign_key: true |
### Association

- belongs_to :item
- has_one    :address
- belongs_to :user




## addresses テーブル

| Column          | Type      | Options                       |
| --------        | ------    | -----------                   |    
| user_item_id    | integer   | null: false,foreign_key: true |
| post_code       | string    | null: false                   |
| prefecture      | integer   | null: false                   |
| city            | string    | null: false                   |
| address         | string    | null: false                   |
| building_name   | string    |                               |
| phone_number    | string    | null: false                   |
### Association

-belongs_to :user_item
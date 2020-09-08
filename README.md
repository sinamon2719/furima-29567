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

- has_many :products
- has_one  :buyers
- has_one  :card



## product テーブル

| Column          | Type      | Options                       |
| --------        | ------    | -----------                   |
| name            | string    | null: false                   |
| price           | string    | null: false                   |
| content         | text      | null: false                   |
| shipping_cost   | string    | null: false                   |
| shipping_days   | string    | null: false                   |
| prefecture_id   | string    | null: false,foreign_key: true |
| judgment        | string    | null: false                   |
| category        | string    |                               |
| user_id         | references| null: false,foreign_key: true |


### Association

- belongs_to :user
- has_one    :product




## buyer テーブル

| Column          | Type      | Options                       |
| --------        | ------    | -----------                   |    
| user_id         | references| null: false,foreign_key: true |
| post_code       | string    | null: false                   |
| prefecture      | string    | null: false                   |
| city            | string    | null: false                   |
| address         | string    | null: false                   |
| building_name   | string    |                               |
| phone_number    | string    | null: false                   |
| category_id     | references| null: false,foreign_key: true |

### Association

- belongs_to :user


## card テーブル

| Column               | Type      | Options                        |
| --------             | ------    | -----------                    |
| user_id              | references| null: false,foreign_key: true  |
| card_number          | integer   | null: false                    |
| expiration_month     | integer   | null: false                    |
| expiration_day       | integer   | null: false                    |
| security_code        | integer   | null: false                    |

### Association

- belongs_to :user


## image テーブル

| Column               | Type   | Options                        |
| --------             | ------ | -----------                    |
| image                | string | null: false                    |
| product_id           | string | null: false,foreign_key: true  |

### Association
- belongs_to :product
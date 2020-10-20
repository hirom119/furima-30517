

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| first_name_kana| string | null: false |
| last_name      | string | null: false |
|last_name_kana  | string | null: false |
| birthday       | date   | null: false |

Association

 - has_many:items
 - has_many:purchaces
 

## items テーブル

| Column             | Type      | Options           |
| ------             | ------    | -----------       |
| user               | references| foreign_key: true |
|name                |string     | null: false       |
|description         | text      |null:false         |
|category_id         |integer    | null: false       |
|status_id           | integer   |null: false        |
|shipping_charges_id |integer    |null:false         |
|prefecture _id      | integer   | null: false       |
|days_id             |integer    | null:false        |
|price               | integer   | null:false        |


Association

- has_one:purchase
- belongs_to :user


##  deliveriesテーブル


| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture _id | integer    | null: false                    |
|city            | string     | null: false                    |
|address         | string     | null: false                    |
|building        | string     | -----------------------------  |
|phone_number    | string     | null false                     |
|purchace        | references | foreign_key: true              |

 Association

 - belongs_to :purchaces


## Purchaces
| Column      | Type       | Options                        |
| item        | references | foreign_key: true              |
| user        | references | foreign_key: true              |

Association

- belongs_to:user
- belongs_to:item
- has_one: delivery
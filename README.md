

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
|statu_id            | integer   |null: false        |
|shipping_charges_id |integer    |null:false         |
|area_id             | integer   | null: false       |
|days_id             |integer    | null:false        |
|price               | integer   | null:false        |


Association

- has_many:delivery
- belongs_to :users


##  deliveryテーブル


| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
|city            | string     | null: false                    |
|address         | string     | null: false                    |
|building        | string     | -----------------------------  |
|phone_number    | string     | null false                     |
|purchace        | references | foreign_key: true              |

 Association

 - belongs_to :purchace
 - belongs_to :users

## Purchace
| Column      | Type       | Options                        |
| item        | references | foreign_key: true              |
| user        | references | foreign_key: true              |

- belongs_to:user
- belongs_to:item

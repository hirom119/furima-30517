

# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| first_name| string | null: false |
| last_name | string | null: false |
|birthday   | date   | null: false |

Association

 - has_many:items
 - has_many:purchace
 

## items テーブル

| Column          | Type      | Options           |
| ------          | ------    | -----------       |
| user            | references| foreign_key: true |
|name             |string     | null: false       |
|description      | text      |null:false         |
|category         |integer    | null: false       |
|statu            | integer   |null: false        |
|shipping_charges |integer    |null:false         |
|area             | integer   | null: false       |
|days             |integer    | null:false        |
|price            | text      | null:false        |
|image            |text       | null:false        |

Association

- has_many:delivery
- belongs_to :users


##  deliveryテーブル


| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| post_code   | string     | null: false                    |
| prefectures | integer    | foreign_key: true              |
|city         | string     | null:false                     |
|address      | string     | null:false                     |
|building     | string     | -----------------------------  |
|phone_number | string     | null false                     |

 Association

 - has_one:purchace
 - belongs_to :users

## Purchace
| Column      | Type       | Options                        |
| item        | references | foreign_key: true              |
| user        | references | foreign_key: true              |

- belongs_to:users
- belongs_to:items
- has_one: delivery
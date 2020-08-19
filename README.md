# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| second_name| string | null: false |
| birth      | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column  | Type       | Options                        |
| ------  | ------     | -----------                    |
| name    | string     | null: false                    |
| price   | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |
| category| string     | null: false                    |
| state   | string     | null: false                    |
| fee     | integer    | null: false                    |
| place   | string     | null: false                    |
| dispatch| string     | null: false                    |

### Association

- belongs_to :users
- has_many :comments
- has_one :buys

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| text    | string     | nill:false                     |

### Association

- belongs_to :users
- belongs_to :items

## buys テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| credit    | integer    | nill:false                     |
| expiration| integer    | nill:false                     |
| s_cord    | integer    | nill:false                     |
| postal    | string     | nill:false                     |
| prefecture| string     | nill:false                     |
| city      | string     | nill:false                     |
| address   | string     | nill:false                     |
| tel       | string     | nill:false                     |

### Association

- belongs_to :users
- belongs_to :items


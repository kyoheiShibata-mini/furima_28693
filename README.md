# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| second_name| string | null: false |
| first_kana | string | null: false |
| second_kana| string | null: false |
| birth      | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :destinations
- has_many :buy_histories

## items テーブル

| Column  | Type       | Options                        |
| ------  | ------     | -----------                    |
| name    | string     | null: false                    |
| price   | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |

### ActiveHash

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| category| integer    | null: false                    |
| state   | integer    | null: false                    |
| fee     | integer    | null: false                    |
| place   | integer    | null: false                    |
| dispatch| integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :destination
- has_one :buy_history

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| text    | string     | null:false                     |

### Association

- belongs_to :user
- belongs_to :item

## destinations テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| postal    | string     | null:false                     |
| city      | string     | null:false                     |
| address   | string     | null:false                     |
| building  | string     |                                |
| tel       | string     | null:false                     |

### ActiveHash

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| prefecture| integer    | null:false                     |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buy_history

## buy_histories テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- has_one :user
- has_one :item
- has_one :destination
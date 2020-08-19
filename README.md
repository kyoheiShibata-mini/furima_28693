# テーブル設計

## users テーブル

| Column     | Type       | Options     |
| --------   | ------     | ----------- |
| nickname   | string     | null: false |
| email      | string     | null: false |
| password   | string     | null: false |
| first_name | string     | null: false |
| second_name| string     | null: false |
| first_kana | string     | null: false |
| second_kana| string     | null: false |
| birth      | date       | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buy_logs

## items テーブル

| Column     | Type       | Options                        |
| ------     | ------     | -----------                    |
| name       | string     | null: false                    |
| price      | integer    | null: false                    |
| explain    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| category_ah| integer    | null: false                    |
| state_ah   | integer    | null: false                    |
| fee_ah     | integer    | null: false                    |
| place_ah   | integer    | null: false                    |
| dispatch_ah| integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :buy_log

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| text    | string     | null:false                     |

### Association

- belongs_to :user
- belongs_to :item

## buy_log テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| buy_log       | reference  | null: false, foreign_key: true |
| postal        | string     | null:false                     |
| city          | string     | null:false                     |
| address       | string     | null:false                     |
| building      | string     |                                |
| tel           | string     | null:false                     |
| prefecture_ah | integer    | null:false                     |

### Association

- belongs_to :buy_log

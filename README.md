# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| name       | string | null: false |
| name_kana  | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| second_name| string | null: false |
| birth      | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :credits
- has_many :destinations

## items テーブル

| Column  | Type       | Options                        |
| ------  | ------     | -----------                    |
| name    | string     | null: false                    |
| price   | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |
| fee     | integer    | null: false                    |

### ActiveHash

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| category| string     | null: false                    |
| state   | string     | null: false                    |
| place   | string     | null: false                    |
| dispatch| string     | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :credit
- has_one :destination

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| text    | string     | nill:false                     |

### Association

- belongs_to :user
- belongs_to :item

## credits テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| credit    | integer    | nill:false                     |
| expiration| integer    | nill:false                     |
| s_cord    | integer    | nill:false                     |

### Association

- belongs_to :user
- belongs_to :item

## destinations テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| postal    | string     | nill:false                     |
| city      | string     | nill:false                     |
| address   | string     | nill:false                     |
| building  | string     | nill:true                      |
| tel       | string     | nill:false                     |

### ActiveHash

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| prefecture| string     | nill:false                     |

### Association

- belongs_to :user
- belongs_to :item
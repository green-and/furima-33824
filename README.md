# テーブル設計

## usersテーブル

| Column | Type | Options |
| --------------- | ------- | ----------- |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birthday_year | integer | null: false |
| birthday_month | integer | null: false |
| birthday_day | integer | null: false |


### Association  
- has_many :items
- has_many :purchases  

## itemsテーブル

| Column | Type | Options |
| --------------- | ------- | ----------- |
| name | string | null: false |
| explanation | text | null:false |
| category | integer | null: false |
| condition | integer | null: false |
| postage | integer | null: false |
| sender_area | integer | null: false |
| required_time | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| Column | Type | Options |
| ---- | ------- | ----------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :address

## Addressesテープル
| Column | Type | Options |
| --------------- | ------- | ----------- |
| postcode | string | null: false |
| prefectures | integer | null: false |
| municipality | string | null: false |
| address | string | null: false |
| building_name | string |  |
| phone_number | string | null: false |
| user | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |
### Association
- belongs_to :purchase
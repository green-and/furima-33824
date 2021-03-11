# テーブル設計

## usersテーブル

| Column | Type | Options |
| --------------- | ------- | ----------- |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date  | null: false |


### Association  
- has_many :items
- has_many :purchases  

## itemsテーブル

| Column | Type | Options |
| --------------- | ------- | ----------- |
| name | string | null: false |
| explanation | text | null:false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| postage_id | integer | null: false |
| sender_area_id | integer | null: false |
| required_time_id | integer | null: false |
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
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテープル
| Column | Type | Options |
| --------------- | ------- | ----------- |
| postcode | string | null: false |
| prefecture_id | integer | null: false |
| municipality | string | null: false |
| address | string | null: false |
| building_name | string |  |
| phone_number | string | null: false |
| purchase | references | null: false, foreign_key: true |
### Association
- belongs_to :purchase
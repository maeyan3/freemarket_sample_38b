# README
__Optionに記載が無ければnull:falseを全てにつける__

## usersテーブル
|Column          |Type   |Options |
|----------------|-------|--------|
|nickname        |string |        |
|email           |string |        |
|password        |string |        |
|confirm_password|string |        |
|confirm_tel     |int    |        |

### Association
- has_many :notices
- has_many :todos
- has_many :rates_users
- has_many :rates, through: :rates_users
- has_many :sales_moneies
- has_many :points
- has_many :orders
- has_many :item_comments
- has_many :likes
- has_many :items
- has_one  :transfer
- has_one  :credit
- has_one  :address
- has_one  :user_detail
- has_one  :profile

## itemsテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|item_name     |string     |                  |
|detail        |string     |                  |
|price         |string     |                  |
|size          |string     |                  |
|ship_burden   |string     |                  |
|ship_method   |string     |                  |
|ship_date     |string     |                  |
|quality       |string     |                  |
|status        |int        |                  |
|user_id       |references |foreign_key: true |
|prefecture_id |references |foreign_key: true |

### Assosiation
- has_many :item_comments
- has_many :item_images
- has_many :items_categories
- has_many :categories, through: :items_categories
- has_many :likes
- has_one :order
- has_one :brand_items
- has_one :brand, through: :brand_items
- belongs_to :user
- belongs_to :prefecture

# README
__※Optionにnull許可の記載が無いものは全てnull:falseをつける__

## usersテーブル
|Column          |Type   |Options |
|----------------|-------|--------|
|nickname        |string |        |
|email           |string |        |
|password        |string |        |
|confirm_password|string |        |
|confirm_tel     |int    |        |

### Association
- has_many :from_user_rates, class_name: 'Rate', foreign_key: 'from_user_id'
- has_many :to_user_rates, class_name: 'Rate', foreign_key: 'to_user_id'
- has_many :notices
- has_many :todos
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
|item_name     |string     |index: true       |
|detail        |string     |                  |
|price         |string     |                  |
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
- has_many :items_sizes
- has_many :sizes, through: :items_sizes
- has_many :likes
- has_one  :order
- has_one  :brand_items
- has_one  :brand, through: :brand_items
- belongs_to :user
- belongs_to :prefecture

## noticesテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|notice_title  |string     |                  |
|notice_text   |string     |                  |
|user_id       |references |foreign_key: true |

### Assosiation
- belongs_to :user

## todosテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|todo_title    |string     |                  |
|todo_text     |string     |                  |
|user_id       |references |foreign_key: true |

### Assosiation
- belongs_to :user

## newsテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|news_title    |string     |                  |
|news_text     |string     |                  |

## ratesテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|rating        |string     |                  |

### Assosiation
- has_many :rates_users

## ratesテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|rate_comment  |string     |                  |
|rate_level    |int        |                  |
|user_id       |int        |                  |
|to_user_id    |int        |                  |

### Assosiation
- belongs_to :from_user, class_name: "User", foreign_key: :from_user_id
- belongs_to :to_user, class_name: "User", foreign_key: :to_user_id

## transferテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|bank               |string     |                  |
|account_type       |string     |                  |
|branch_code        |int        |                  |
|account_number     |int        |                  |
|account_last_name  |string     |                  |
|account_first_name |string     |                  |
|user_id            |references |foreign_key: true |
|sales_money_id     |references |foreign_key: true |
|user_detail_id     |references |foreign_key: true |

### Assosiation
- belongs_to :user
- belongs_to :sales_money
- belongs_to :user_detail





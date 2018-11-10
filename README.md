# README
__※Optionにnull許可の記載が無いものは全てnull:falseをつける__

## usersテーブル
|Column            |Type   |Options |
|------------------|-------|--------|
|nickname          |string |        |
|email             |string |        |
|password          |string |        |
|confirm_password  |string |        |
|confirm_telephone |int    |        |

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
- has_one  :items_brand
- has_one  :brand, through: :items_brand
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
|rate_comment  |string     |                  |
|rate_level    |int        |                  |
|user_id       |int        |                  |
|to_user_id    |int        |                  |

### Assosiation
- belongs_to :from_user, class_name: "User", foreign_key: :from_user_id
- belongs_to :to_user, class_name: "User", foreign_key: :to_user_id

## transfersテーブル
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

## user_detailsテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|birth_day     |int        |                  |
|birth_month   |int        |                  |
|birth_year    |int        |                  |
|user_id       |references |foreign_key: true |
|address_id    |references |foreign_key: true |

### Assosiation
- has_one    :transfer
- belongs_to :user
- belongs_to :address

## profilesテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|profile       |string     |                  |
|user_id       |references |foreign_key: true |

### Assosiation
- belongs_to :user

## sales_moneyテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|get_money     |int        |                  |
|money_limit   |date       |                  |
|user_id       |references |foreign_key: true |

### Assosiation
- has_many   :transfer
- belongs_to :user

## pointsテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|get_point     |int        |                  |
|point_limit   |date       |                  |
|user_id       |references |foreign_key: true |

### Assosiation
- belongs_to :user

## creditsテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|credit_number |int        |                  |
|limit_month   |int        |                  |
|limit_year    |int        |                  |
|security_code |int        |                  |
|user_id       |references |foreign_key: true |

### Assosiation
- belongs_to :user

## likesテーブル
|Column        |Type       |Options           |
|--------------|-----------|------------------|
|user_id       |references |foreign_key: true |
|item_id       |references |foreign_key: true |

### Assosiation
- belongs_to :user
- belongs_to :item

## item_commentsテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|item_comment_text |string     |                  |
|user_id           |references |foreign_key: true |
|item_id           |references |foreign_key: true |

### Assosiation
- belongs_to :user
- belongs_to :item

## ordersテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|user_id           |references |foreign_key: true |
|item_id           |references |foreign_key: true |

### Assosiation
- belongs_to :user
- belongs_to :item

## sizesテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|size_name         |string     |                  |
|parent_id         |int        |                  |

### Assosiation
- has_many :items_sizes
- has_many :sizes, through: :items_sizes

## items_sizesテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|item_id           |references |foreign_key: true |
|size_id           |references |foreign_key: true |

### Assosiation
- belongs_to :item
- belongs_to :size

## Categoriesテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|category_name     |string     |                  |
|parent_id         |int        |                  |

### Assosiation
- has_many :items_categories
- has_many :categories, through: :items_categories

## items_categoriesテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|item_id           |references |foreign_key: true |
|category_id       |references |foreign_key: true |

### Assosiation
- belongs_to :item
- belongs_to :category

## Brandsテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|brand_name        |string     |                  |

### Assosiation
- has_many :items_brand

## Items_brandテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|item_id           |references |foreign_key: true |
|category_id       |references |foreign_key: true |

### Assosiation
- belongs_to :item
- belongs_to :brand

## Item_imagesテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|item_image_src    |string     |                  |
|item_id           |references |foreign_key: true |

### Assosiation
- belongs_to :item

## Addressesテーブル
|Column             |Type       |Options           |
|-------------------|-----------|------------------|
|first_name         |string     |                  |
|last_name          |string     |                  |
|first_name_reading |string     |                  |
|last_name_reading  |string     |                  |
|postal_code        |int        |                  |
|city               |string     |                  |
|block              |string     |                  |
|user_id            |references |foreign_key: true |
|prefecture_id      |references |foreign_key: true |

### Assosiation
- has_one    :user_detail
- has_one    :building
- has_one    :address_tel
- belongs_to :user
- belongs_to :prefecture

## buildingsテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|building_name     |string     |                  |
|address_id        |references |foreign_key: true |

### Assosiation
- belongs_to :address

## address_telephonesテーブル
|Column     |Type       |Options           |
|-----------|-----------|------------------|
|number     |int        |                  |
|address_id |references |foreign_key: true |

### Assosiation
- belongs_to :address

## prefectureテーブル
|Column            |Type       |Options           |
|------------------|-----------|------------------|
|prefecture_name     |string     |                  |

### Assosiation
- has_many :items
- has_many :addresses

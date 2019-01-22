# README

## Users

deviseのデフォルトカラムは除く

|Column|Type|Option|
|------|----|------|
|nickname|string|null:false|
|introduction|string|
|icon|text|
|first_name|string|
|last_name|string|
|first_reading|string|
|last_reading|string|
|phone_number|string|
|postal_code|integer|
|prefecture_id|integer|
|city|string|
|building_name|string|
|address|string|
|birth_day|integer|
|birth_month|integer|
|birth_year|integer|
|point|integer|null:false, default:0|
|proseed|integer|null:false, default:0|


### Association

- has_many items
- has_many comments
- has_many sns_informations
- has_many transactions
- has_many credit_card
- has_many:bought_items,foreign_key: "buyer_id",class_name: "Item"
- has_many to_do_things
- has_many notifications
- has_many likes
- has_many reviews
- belongs_to prefecture


## Items

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|integer|null:false|
|describe|text|null:false|
|status|integer|null:false|
|burden|integer|null:false|
|prefecture|integer|null:false|
|delivery_day|integer|null:false|
|delivery_method|integer|null:false|
|size_id|references|foreign_key:true|
|brand_id|references|foreign_key:true|
|category_id|references|null:false, foreign_key:true|
|sellre_id(販売者のuser_id)|references|foreign_key:true|
|buyer_id(購入者のuser_id)|references|foreign_key:true|



### Association

statu, burden(配送料負担), prefecture, delivery_day, delivery_methodはenumで管理*ER図参照
- belongs_to user
- has_many comments
- has_many  item_images
- has_many likes
- has_one transaction
- belongs_to categories
- belongs_to size
- belongs_to brand
- belongs_to prefecture
- belongs_to seller, class:name:"User"
- belongs_to buyer, class:name:"User"

## sizes

|Column|Type|Option|
|------|----|------|
|size|string|null:false|

### Association

- has_many items


## brands

|Column|Type|Option|
|------|----|------|
|name|string|null:false|

### Association

 - has_many items



## Item_images

|Column|Type|Option|
|------|----|------|
|image|text|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to  item

## categories

|Column|Type|Option|
|------|----|------|
|name|string|unique:true, null:false|
|ancestry|string|

### Association

gem 'ancestry'を利用
has_many items

## Comments

|Column|Type|Option|
|------|----|------|
|comment|text|null:false|
|user_id|references|foreign_key:true|
|item_id|references|foreign_key:true|

### Association

- belongs_to item
- belongs_to user

## Reviews

|Column|Type|Option|
|------|----|------|
|review|integer|null:false|
|user_id|references|foreign_key:true|

### Association

enum review {good:0,usually:1,bad:2}
- belongs_to user


## sns_informations

|Column|Type|Option|
|------|----|------|
|provider|text|null:false|
|token|text|null:false|
|user_id|references|foreign_key:true|

### Association

enum provider{facebook:0,google:2}
- belongs_to user

## Notifications

|Column|Type|Option|
|------|----|------|
|text|text|null:false|
|user_id|references|foreign_key:true|

### Association

- belongs_to user

## to_do_things

|Column|Type|Option|
|------|----|------|
|text|text|null:false|
|user_id|references|foreign_key:true|

### Association

- belongs_to user


## likes

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key:true|
|item_id|references|foreign_key:true|

### Association

- belongs_to user
- belongs_to item


## transactions

|Column|Type|Option|
|------|----|------|
|status|integer|null:false|
|seller_id|references|foreign_key:true|
|buyer_id|references|foreign_key:true|
|item_id|references|foreign_key:true|
|user_id|references|foreign_key:true|

### Association

enum status {出品中: 0,取引中: 1,売却済: 2}
- belongs_to user
- belongs_to item

## credit_cards

|Column|Type|Option|
|------|----|------|
|token|text|unique:true, null:false|
|user_id|references|foreign_key:true|

### Association

 - belongs_to user



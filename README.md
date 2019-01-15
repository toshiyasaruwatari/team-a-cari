# README

## Users

deviseのデフォルトカラムは除く

|Column|Type|Option|
|------|----|------|
|nickname|string|null:false|
|introduction|string|
|first_name|string|
|last_name|string|
|first_reading|string|
|last_reading|string|
|postal_code|integer|
|prefecture|string|
|city|string|
|building_name|string|
|address|string|
|birth_day|integer|
|birth_month|integer|
|birth_year|integer|
|icon|text|
|point|integer|null:false|
|proseed|integer|null:false|

### Association

- has_many items
- has_many comments
- has_many sns_informations
- has_many transactions
- has_one credit_card
- has_many has_many:buyed_items,foreign_key: "buyer_id",class_name: "Item"
- has_many has_many:exhibition_items,->{where("buyer_id is NULL")},foreign_key: "seller_id",class_name: "Item"
- has_many has_many:sold_items,->{where("buyer_id is not NULL")},foreign_key: "seller_id",class_name: "Item"



## Items

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|integer|null:false|
|describe|text|null:false|
|status|string|null:false|
|derivery_fee|integer|null:false|
|region|string|null:false|
|how_days|integer|null:false|
|category_id|references|foreign_key:true|
|sellre_id(販売者のuser_id)|references|foreign_key:true|
|buyer_id(購入者のuser_id)|references|foreign_key:true|
|brand_id|references|foreign_key:true|
|category_id|references|references|foreign_key:true|
|size_id|references|references|foreign_key:true|


### Association

- belongs_to user
- has_many comments
- has_many  item_images
- has_one transaction
- has_many categories
- belongs_to size
- belongs_to seller, class:name:"User"
- belongs_to buyer, class:name:"User"

## sizes

|Column|Type|Option|
|------|----|------|
|size|string|null:false|

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
|name|string|unique:true|
|parent_id|references|foreign_key:true|

### Association
has_many categories,class_name:"Category",foreign_key:true
belongs_to parent, class_name:"Category"

## Comments

|Column|Type|Option|
|------|----|------|
|comment|text|
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
enum review {good:0,normal:1,bad:2}
- belongs_to user


## sns_informations

|Column|Type|Option|
|------|----|------|
|provider|text|null:false|
|user_id|references|foreign_key:true|

### Association
enum provider{facebook:0,line:1,google:2,twitter:3}
- belongs_to user

## Notification

|Column|Type|Option|
|------|----|------|
|text|text|
|user_id|references|foreign_key:true|

### Association
belongs_to user


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
|status|string|null:false|
|user_id|references|foreign_key:true|
|item_id|references|foreign_key:true|

### Association
enum status {good:0,normal:1,bad:2}
- belongs_to user
- belongs_to item

## credit_cards

|Column|Type|Option|
|------|----|------|
|token|text|unique:true, null:false|
|user_id|references|foreign_key:true|

### Association

 - belongs_to user



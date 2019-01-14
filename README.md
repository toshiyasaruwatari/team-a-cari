# README

## Users

deviseのデフォルトカラムは除く

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|icon|text|
|profile_text|text|

### Association

- has_many items
- has_many comments
- has_one sns_group
- has_one point
- has_one proceed
- has_one user_information
- has_many transactions
- has_one credit_card


## User_informations

|Column|Type|Option|
|------|----|------|
|first_name|string|null: false|
|last_name|string|null:false|
|first_reading|string|null:failse|
|last_reading|string|null:false|
|postal_code|integer|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|adress|text|null:false|
|building_name|string|
|day_of_birth|integer|null:false|

### Association

- belongs_to user




## Items

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|integer|null:false|
|describe|text|null:false|
|top_category_id|references|foreign_key:true|
|middle_category_id|references|foreign_key:true|
|bottom_id|references|foreign_key:true|
|sellre_id(user_id)|references|foreign_key:true|
|buyer_id|references|references|foreign_key:true|
|category_id|references|references|foreign_key:true|
|size_id|references|references|foreign_key:true|


### Association

- belongs_to user
- has_many comments
- has_many  item_images
- has_one order
- has_one item_status
- has_one item_size
- has_one transaction
- has_one item_categories
- belongs_to category
- belongs_to size

## sizes

|Column|Type|Option|
|------|----|------|
|size|string|null:false|

### Association

- has_many items



## Orders
発送詳細

|Column|Type|Option|
|------|----|------|
|delivery_fee|string|null:false|
|region|string|null:false|
|how_days|string|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to  item


## Item_images

|Column|Type|Option|
|------|----|------|
|image|text|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to  item

## item_categories

|Column|Type|Option|
|------|----|------|
|name|string|unique:true|
|item_id|references|foreign_key:true|
|parent_id|references|foreign_key:true|
|set_size|boolean|default:true|
サイズがあればtrue,なければfalse


### Association
has_many children
belongs_to parent

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
|item_id|references|foreign_key:true|

### Association

- belongs_to user

## Proceeds

|Column|Type|Option|
|------|----|------|
|proceed|integer|null:false|
|user_id|references|foreign_key:true|

### Association

- belongs_to user

## Points

|Column|Type|Option|
|------|----|------|
|point|integer|null:false|
|user_id|references|foreign_key:true|

### Association

- belongs_to user

## sns_groups

|Column|Type|Option|
|------|----|------|
|facebook|text|
|twitter|text|
|google|text|
|line|text|
|user_id|references|foreign_key:true|

### Association

- belongs_to user

## News

|Column|Type|Option|
|------|----|------|
|topic|text|

- belongs_to

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

- belongs_to user
- belongs_to item

## credit_cards

|Column|Type|Option|
|------|----|------|
|token|text|unique:true, null:false|
|user_id|references|foreign_key:true|

### Association

 - belongs_to user



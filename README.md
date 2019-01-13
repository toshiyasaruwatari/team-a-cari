# README

## Usersテーブル

|Column|Type|Option|
|:------|:----|:------|
| name | string | null:  false |
| icon | text |   |
| profile_text | text |
| email | text | null: false |
| password |  string  | null: false |


### Association

- has_many items
- has_many comments
- has_one sns_group
- has_one point
- has_one proceed
- has_one user_information


## User_informationsテーブル

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




## Itemsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|integer|null:false|
|describe|text|null:false|
|item_detail_id|references|null:false|
|sellre_id(user_id)|references|null:false|
|buyer_id|references|
|buy_sell|bool|

### Association

- belongs_to user
- has_many comments
- has_many  item_images
- has_one order
- has_one item_status
- has_one item_size

## Item_sizesテーブル

|Column|Type|Option|
|------|----|------|
|size|string|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to item


## Item_statusesテーブル

|Column|Type|Option|
|------|----|------|
|status|string|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to item

## Ordersテーブル

|Column|Type|Option|
|------|----|------|
|delivery_fee|string|null:false|
|region|string|null:false|
|how_days|string|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to  item


## Item_imagesテーブル

|Column|Type|Option|
|------|----|------|
|image|text|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to  item

## Item_categoriesテーブル(親カテゴリー)

|Column|Type|Option|
|------|----|------|
|name|string|

### Association

- has_many item_types




## Item_typesテーブル(子カテゴリー)

|Column|Type|Option|
|------|----|------|
|name|string|
|item_category_id|references|foreign_key:true|

### Association

- belongs_to item_category

- has_many   item_details



## Item_detailsテーブル(孫カテゴリー)

|Column|Type|Option|
|------|----|------|
|name|string|
|item_category_id|references|foreign_key:true|
|item_id|references|foreign_key:true|

### Association

- belongs_to item_type
- has_many items


## Commentsテーブル

|Column|Type|Option|
|------|----|------|
|comment|text|
|user_id|references|foreign_key:true|
|item_id|references|foreign_key:true|

### Association

- belongs_to item
- belongs_to user

## Reviewsテーブル

|Column|Type|Option|
|------|----|------|
|review|integer|null:false|
|item_id|references|foreign_key:true|

### Association

- belongs_to user

## Proceedsテーブル

|Column|Type|Option|
|------|----|------|
|proceed|integer|
|user_id|references|foreign_key:true|

### Association

- belongs_to user

## Pointsテーブル

|Column|Type|Option|
|------|----|------|
|point|integer|null:false|
|user_id|references|foreign_key:true|

### Association

- belongs_to user

## sns_groupsテーブル

|Column|Type|Option|
|------|----|------|
|facebook|text|
|twitter|text|
|google|text|
|line|text|
|user_id|references|foreign_key:true|

### Association

- belongs_to user

## Newsテーブル

|Column|Type|Option|
|------|----|------|
|topic|text|

- belongs_to

## likesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key:true|
|item_id|references|foreign_key:true|

### Association

- belongs_to user
- belongs_to item


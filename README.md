# README

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|email|varchar|null: false, foreign_key: true|

### Association
- has_many :groups, throuth: :groups_users
- has_many :posts

## groupテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false, foreign_key: true|

### Association
- has_many :users, throuth: :groups_users
- has_many :posts

## postテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false, foreign_key: true|
|image|int|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


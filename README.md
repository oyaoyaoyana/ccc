
# user

|column|type|options|
|----|------|-------|
|id|integer|null: false|
|name|string|null: false unique: true　add_index|
|E-mail|string|null: false unique: true|
|Password|string|null: false|

## アソシエーション
has_many :groups through:group_users
has_many :messages


# group_user

|column|type|options|
|---|-----|------|
|user_id|integer|null: false　foreign_key: true|
|group_id|integer|null: false　foreign_key: true|

## アソシエーション
belongs_to :group
belongs_to :user


# group

|column|type|options|
|---|-----|-----|
|name|string|null: false unique: true|

## アソシエーション
has_many:users　through:group_users
has_many :messages


# message

|column|type|options|
|---|-----|-----|
|user_id|integer|null: false　foreign_key: true|
|group_id|integer|null: false　foreign_key: true|
|body|text||
|image|string||

## アソシエーション
belongs_to :group
belongs_to :user

# README

#　usersテーブル

| Column             | Type   | Options                   |
| ------------------ | -------| ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | string | null: false               |

### Association

* has_many :products
* has_many :managements
- has_one :customer

#　products テーブル

| Column            | Type       | Options                        |
| ----------------- | -----------| ------------------------------ |
| title             | string     | null: false                    |
| concept           | text       | null: false                    |
| category_id       | integer    | null: false                    |
| situation_id      | integer    | null: false                    |
| delivery_price_id | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| delivery_date_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
* has_many :managements
- belongs_to :user
- has_one :customer

# customers テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| post_code      | string     | null: false                    |
| area_id        | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| build          | string     |                                |
| phone          | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- has_one :user
- has_one :product
- belongs_to :management

# managements テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :customer
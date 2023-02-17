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
| birthday           | date   | null: false               |

### Association
* has_many :items
* has_many :managements

#　items テーブル

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
- belongs_to :user
- has_one :management

# orders テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| post_code      | string     | null: false                    |
| area_id        | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| build          | string     |                                |
| phone          | string     | null: false                    |
| management     | references | null: false, foreign_key: true |

### Association
- belongs_to :management  

# managements テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- has_one :customer
- belongs_to :user
- belongs_to :item
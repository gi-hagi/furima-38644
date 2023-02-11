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

#　productテーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| title          | string     | null: false                    |
| concept        | text       | null: false                    |
| category       | string     | null: false                    |
| situation      | string     | null: false                    |
| delivery_price | string     | null: false                    |
| area           | string     | null: false                    |
| date           | string     | null: false                    |
| price          | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

# customer

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| post_code      | string     | null: false                    |
| pref           | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| build          | string     |                                |
| phone          | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |
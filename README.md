# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :address



## address テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------                    |
| departure         | string     | null: false                    |
| destination       | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user



## history  テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------                    |
| item_name         | string     | null: false                    |
| description       | text       | null: false                    |

### Association




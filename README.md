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
## user テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| name      | string  | null: false |
| code      | integer | null: false |
| email     | integer | null: false |
| password  | string  | null: false |

### Association

- has_many :customer
- has_many :product

## customer テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| family_name    | string     | null: false                    |
| name           | string     | null: false                    |
| phone_number   | string     | null: false                    |
| note1          | string     |                                |
| note2          | string     |                                |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :product

## product テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     |                                |
| z_code      | integer    | null: false                    |
| num         | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| customer_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :customer


## stock テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| code          | integer    |                                |
| ctiy          | string     | null: false                    |
| tenpo_name    | string     | null: false                    |
| category      | string     | null: false                    |
| z_code        | integer    | null: false                    |
| z1            | integer    | null: false                    |
| z2            | integer    | null: false                    |
| z3            | integer    | null: false                    |
| publisher     | string     | null: false                    |
| z_name        | string     | null: false                    |
| nyuka_num     | integer    | null: false                    |
| price         | integer    | null: false                    |
| note          | string     | null: false                    |
| s_code        | integer    | null: false                    |
| form          | string     | null: false                    |
| size          | string     | null: false                    |
| bundles       | integer    | null: false                    |
| fraction      | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

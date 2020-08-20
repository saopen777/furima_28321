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

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| user_password    | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many :items
- has_one :order

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| items_user_id | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| price         | string     | null: false                    |
| description   | string     | null: false                    |
| burden        | integer    | null: false                    |
| days          | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |

## Association

- belongs_to :users
- has_one :order

## purchase テーブル

| Column       | Type    | Option      |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  | null: true  |
| phone_number | string  | null: false |

## Association

- has_one :order

## order テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

## Association

- belongs_to :users
- belongs_to :items
- belongs_to :purchase
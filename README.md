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
## アプリケーション名

### Teiki29770(定期管理アプリ)

## アプリケーション概要

このアプリは本屋さんにおけるお客様管理を主眼において作成している最中です。
- お客様管理
- お客様の注文商品(雑誌)、定期商品(毎週・毎月販売される同名雑誌を予め取置きしておく)管理
- 配送会社より届く「入荷予定表」に注文商品の印をつけ、
  取置き漏れや入荷漏れの対応を即行えるようにする.
上記三点を先ずは目指して作成中です。

## URL

https://teiki29770.herokuapp.com/

## テスト用アカウント

- Basic認証ID：admin
- Basic認証PASS：2222
- テストemail：aaa@aaa
- テストPASS：111aaa

## 利用方法

1. お客様の情報を入力
2. [1]のお客様の注文商品の情報(商品名、雑誌コード、取置き冊数)を入力。(予定)
3. 配送会社から届く入荷予定表に注文商品の印をつける。

## 目指した課題解決
### 解決点
主に、九州地区の特に新店(営業開始より1年以内)を主眼として下記2点を解決するために開発しています。
- A.お客様注文商品(雑誌)の取置き漏れ撲滅。
- B.入荷漏れ商品の早期対応。
### 前提情報
1. 九州地区の雑誌入荷は全国発売日よりも、２〜３日遅れてしまう。
2. 入荷予定表は全国どこでも全国発売日の2日前に配布される。
3. 雑誌の注文品(定期物含む)は、DVD付きなどの特別なものを除き  全国発売日の２週間程度前に登録しないと入荷してこない。
4. 入荷物は(特に新店)発行冊数によっては注文していても、減数されてしまう。
5. その代わり、返本に関しては特にハードルがなく幾ら返本してもペナルティがない。
6. 商品の追加注文は配送会社に在庫があれば
  全国発売日より発注可能で早ければ3〜５日で店着する。
### 解説
九州地区には本屋は配送上の関係から前提条件のようなことから  
注文品が届かないという事がしばしば起こります。  
また、注文を受ける時期によっては、注文品が届きません。  
特に新店は販売実績がないため、その傾向が顕著です。  
そこで、前提情報の「6」に目をつけ、事前に入荷物と注文商品の状況を把握し発注を行う事で  
「九州地区の入荷日(発売日)に間に合わせる」事が出来るようにしています。

このアプリは私が14年ほど前に独学で作成したVBAを元に  
改善したい所を付け加えたアプリです。  
VBAでは前提情報の「4」「5」を逆手にとって、雑誌やコミックの追加注文を行い  
競合店よりも商品種類と商品量を充実させて差別化を図り2年目意向の実績づくりを行っておりました。  

## 洗い出した要件
スプレッドシートにまとめております。下記URLをご確認くださいませ。  
https://docs.google.com/spreadsheets/d/1N6YRz5M5a9-4LwM_WK32WU7mPP6Rz-ns33XX0BXssQ4/edit#gid=282075926

## 実装した機能についてのGIFと説明
現状、まだまとまった実装ができておりません。

## 実装予定の機能
現状、当初の要件を実装できておりません。

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

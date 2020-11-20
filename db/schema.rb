# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_119_094_825) do
  create_table 'calendars', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.date 'day', null: false
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'customers', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'name_kana', null: false
    t.string 'phone_number', null: false
    t.string 'note1'
    t.string 'note2'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'stocks', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'store_code', comment: '書店コード'
    t.string 'district', comment: '地区名'
    t.string 'store_name', comment: '書店名'
    t.date 'delivery_date', comment: '送品日付'
    t.string 'display', comment: '陳列'
    t.string 'magazine_code', comment: '雑誌コード'
    t.string 'v1', comment: '号数'
    t.string 'v2', comment: '日付'
    t.string 'v3', comment: '年'
    t.string 'publisher', comment: '出版社名'
    t.string 'magazine_name', comment: '雑誌名'
    t.integer 'num', comment: '冊数'
    t.integer 'price', comment: '本体価格'
    t.string 'special', comment: '特号'
    t.integer 'reservation', comment: '予約数'
    t.string 'slip', comment: '伝票番号'
    t.string 'product_code', comment: '商品コード'
    t.string 'i_form', comment: '発行形態'
    t.string 'format', comment: '判型'
    t.string 'bundle', comment: '束数'
    t.string 'fraction', comment: '端数'
    t.string 'isbn', comment: 'ISBNコード'
    t.string 'purchased', comment: '買切雑誌'
    t.bigint 'calendar_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['calendar_id'], name: 'index_stocks_on_calendar_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'code', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'stocks', 'calendars'
end

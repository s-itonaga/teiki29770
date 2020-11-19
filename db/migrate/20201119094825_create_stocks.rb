class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string  :store_code,    comment:'書店コード'
      t.string  :district,      comment:'地区名'
      t.string  :store_name,    comment:'書店名'
      t.date    :delivery_date, comment:'送品日付'
      t.string  :display,       comment:'陳列'
      t.string  :magazine_code, comment:'雑誌コード'
      t.string  :v1,            comment:'号数'
      t.string  :v2,            comment:'日付'
      t.string  :v3,            comment:'年'
      t.string  :publisher,     comment:'出版社名'
      t.string  :magazine_name, comment:'雑誌名'
      t.integer :num,           comment:'冊数'
      t.integer :price,         comment:'本体価格'
      t.string  :special,       comment:'特号'
      t.integer :reservation,   comment:'予約数'
      t.string  :slip,          comment:'伝票番号'
      t.string  :product_code,  comment:'商品コード'
      t.string  :i_form,        comment:'発行形態'
      t.string  :format,        comment:'判型'
      t.string  :bundle,        comment:'束数'
      t.string  :fraction,      comment:'端数'
      t.string  :isbn,          comment:'ISBNコード'
      t.string  :purchased,     comment:'買切雑誌'
      t.references :calendar, null: false, foreign_key: true
      t.timestamps
    end
  end
end

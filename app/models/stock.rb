class Stock < ApplicationRecord
  belongs_to :calendar

  def self.csv_import(file, calendar)
    stocks = []
    CSV.foreach(file.path, headers: true) do |row|
      stock = Stock.new
      stock = find_by(id: row['id']) || new
      row_hash = row.to_hash.slice(*CSV_HEADER.keys)
      stock.attributes = row_hash.transform_keys(&CSV_HEADER.method(:[]))
      stock['calendar_id'] = calendar
      stocks << stock
    end
    Stock.import stocks
  end

  CSV_HEADER = {
    '書店コード' => 'store_code',
    '地区名' => 'district',
    '書店名' => 'store_name',
    '送品日付' => 'delivery_date',
    '陳列' => 'display',
    '雑誌コード' => 'magazine_code',
    '号数' => 'v1',
    '日付' => 'v2',
    '年' => 'v3',
    '出版社名' => 'publisher',
    '雑誌名' => 'magazine_name',
    '冊数' => 'num',
    '本体価格' => 'price',
    '特号' => 'special',
    '予約数' => 'reservation',
    '伝票番号' => 'slip',
    '商品コード' => 'product_code',
    '発行形態' => 'i_form',
    '判型' => 'format',
    '束数' => 'bundle',
    '端数' => 'fraction',
    'ISBNコード' => 'isbn',
    '買切雑誌' => 'purchased'
  }.freeze
end

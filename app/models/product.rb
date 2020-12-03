class Product < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :z_code, numericality: { only_integer: true }, length: { maximum: 5 }
    validates :num, numericality: { only_integer: true }, length: { maximum: 5 }
    validates :release
  end

  def self.import(file, customer)
    CSV.foreach(file.path, encoding: 'Shift_JIS:UTF-8', headers: true) do |row|
      product = find_by(id: row['id']) || new
      row_hash = row.to_hash.slice(*CSV_HEADER.keys)
      product.attributes = row_hash.transform_keys(&CSV_HEADER.method(:[]))
      product['customer_id'] = customer
      product.save
    end
  end

  CSV_HEADER = {
    '雑誌名' => 'name',
    '雑誌コード' => 'z_code',
    '取置冊数' => 'num',
    '発売日' => 'release'
  }.freeze
end

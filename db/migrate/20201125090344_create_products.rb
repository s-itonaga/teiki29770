class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                      comment: '雑誌名'
      t.integer :z_code, null: false,      comment: '雑誌コード'
      t.integer :num,    null: false,      comment: '発売日'
      t.string :release, null: false,      comment: '取置冊数'
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end

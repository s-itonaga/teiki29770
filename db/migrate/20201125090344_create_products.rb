class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :z_code, null: false
      t.integer :num,    null: false
      t.string :release, null: false
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end

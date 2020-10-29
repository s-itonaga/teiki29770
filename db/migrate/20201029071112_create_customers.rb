class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :family_name,   null: false
      t.string :name,          null: false
      t.integer :phone_number, null: false
      t.string :note1
      t.string :note2
      t.integer :user_id
      t.timestamps
    end
  end
end

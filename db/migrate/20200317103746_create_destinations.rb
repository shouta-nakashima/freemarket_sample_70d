class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :d_first_name,           null: false
      t.string :d_family_name,          null: false
      t.string :d_first_name_kana,      null: false
      t.string :d_family_name_kana,     null: false
      t.integer :post_code, limit: 7,   null: false
      t.integer :prefecture_code,       null: false
      t.string :city,                   null: false
      t.string :house_number,           null: false
      t.string :bilding_name
      t.integer :phone_number,          unique: true
      t.references :user
      t.timestamps
    end
  end
end

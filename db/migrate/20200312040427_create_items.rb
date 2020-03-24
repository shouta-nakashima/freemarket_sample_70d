class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                         null: false
      t.text :introduction,                   null: false
      t.integer :category_id,                 null: false, foreign_key: true   
      t.text :brand                         
      t.integer :item_condition_id,           null: false, foreign_key: true
      t.integer :postage_payer_id,            null: false, foreign_key: true
      t.integer :prefecture_code_id,          null: false, foreign_key: true
      t.integer :preparation_day_id,          null: false, foreign_key: true
      t.integer :price,                       null: false
      t.integer :seller_id,                   null: false, foreign_key: true
      t.integer :buyer_id,                    foreign_key: true
      t.timestamps
    end
  end
end

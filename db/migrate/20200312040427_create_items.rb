class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :prefecture_code, null: false
      t.string :item_images_id, null: false
      t.string :category_id, null: false
      t.string :brand_id
      t.string :item_condition_id, null: false
      t.string :preparation_day_id
      t.string :postage_payer_id, null: false
      t.string :size_id, null: false
      t.string :seller_id, null: false
      t.string :buyer_id
      t.timestamps
    end
  end
end

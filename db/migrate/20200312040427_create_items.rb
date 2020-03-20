class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_images_id
      t.string :name
      t.text :introduction
      t.string :category_id
      t.string :brand
      t.string :item_condition_id
      t.string :postage_payer_id
      t.integer :prefecture_code
      t.string :preparation_day_id
      t.integer :price
      t.string :seller_id
      t.string :buyer_id
      t.string :user_id
      t.timestamps
    end
  end
end

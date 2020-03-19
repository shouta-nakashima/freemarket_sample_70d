class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.integer :prefecture_code
      t.string :item_images_id
      t.string :category_id
      t.string :brand_id
      t.string :item_condition_id
      t.string :preparation_day_id
      t.string :postage_payer_id
      t.string :size_id
      t.string :user_id
      t.timestamps
    end
  end
end

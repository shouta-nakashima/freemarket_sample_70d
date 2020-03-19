class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :src
      t.string :item_id
      t.timestamps
    end
  end
end

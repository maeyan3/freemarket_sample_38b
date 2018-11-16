class CreateItemsBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :items_brands do |t|
      t.references :item,  foreign_key: true
      t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end

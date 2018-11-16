class CreateItemsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :items_categories do |t|
      t.references :item,     foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end

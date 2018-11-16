class CreateItemsSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :items_sizes do |t|
      t.references :item, foreign_key: true
      t.references :size, foreign_key: true
      t.timestamps
    end
  end
end

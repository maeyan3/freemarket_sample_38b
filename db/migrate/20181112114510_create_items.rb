class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string     :item_name,   null: false, index: true
      t.string     :detail,      null: false
      t.string     :size,        null: false
      t.string     :ship_burden, null: false
      t.string     :ship_method, null: false
      t.string     :ship_date,   null: false
      t.string     :quality,     null: false
      t.integer    :price,       null: false
      t.integer    :status,      null: false
      t.references :user,        foreign_key: true
      t.references :prefecture,  foreign_key: true
      t.timestamps
    end
  end
end

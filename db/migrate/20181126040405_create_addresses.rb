class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :first_name,null:false
      t.string :last_name,null:false
      t.string :first_name_reading,null:false
      t.string :last_name_reading,null:false
      t.integer :postal_code,null:false
      t.string :city,null:false
      t.string :block,null:false
      t.references :user,foreign_key: true
      t.references :prefecture,foreign_key: true

      t.timestamps
    end
  end
end

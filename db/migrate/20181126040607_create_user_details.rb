class CreateUserDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :user_details do |t|
      t.integer :birth_day,null:false
      t.integer :birth_month,null:false
      t.integer :birth_year,null:false
      t.references :user,foreign_key: true
      t.references :address,foreign_key: true
      t.timestamps
    end
  end
end

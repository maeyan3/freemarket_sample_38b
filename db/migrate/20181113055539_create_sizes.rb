class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.string  :size_name, null: false
      t.integer :parent_id, null: false
      t.timestamps
    end
  end
end

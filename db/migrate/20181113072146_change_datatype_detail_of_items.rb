class ChangeDatatypeDetailOfItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :detail, :string, limit: 1000
  end
end

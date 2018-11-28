class CreateSalesMoneys < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_moneys do |t|
      t.integer :get_money, null: false
      t.date :money_limit,  null: false
      t.references  :user,  foreign_key: true
      t.timestamps
    end
  end
end

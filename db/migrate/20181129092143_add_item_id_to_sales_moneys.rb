class AddItemIdToSalesMoneys < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales_moneys, :item, foreign_key: true
  end
end

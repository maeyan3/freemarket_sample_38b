class AddCustomerIdToCredits < ActiveRecord::Migration[5.1]
  def change
    add_column :credits, :customer_id, :string, null: false
  end
end

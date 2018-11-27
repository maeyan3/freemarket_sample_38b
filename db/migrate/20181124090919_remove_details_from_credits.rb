class RemoveDetailsFromCredits < ActiveRecord::Migration[5.1]
  def change
    remove_column :credits, :credit_number, :integer
    remove_column :credits, :limit_month, :integer
    remove_column :credits, :limit_year, :integer
    remove_column :credits, :security_code, :integer
  end
end

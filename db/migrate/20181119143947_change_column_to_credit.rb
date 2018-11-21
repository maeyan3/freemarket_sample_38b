class ChangeColumnToCredit < ActiveRecord::Migration[5.1]
  def up
    change_column :credits, :credit_number, :string
  end

  # 変更前の内容
  def down
    change_column :credits, :credit_number, :integer
  end
end

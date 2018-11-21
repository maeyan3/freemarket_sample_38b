class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile, :string, limit: 1000
  end
end

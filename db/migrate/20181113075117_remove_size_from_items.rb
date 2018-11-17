class RemoveSizeFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :size, :string
  end
end

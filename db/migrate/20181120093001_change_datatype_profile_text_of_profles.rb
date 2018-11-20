class ChangeDatatypeProfileTextOfProfles < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :profile_text, :string, limit: 1000
  end
end

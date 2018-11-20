class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|

      t.integer     :credit_number,    null: false
      t.integer     :limit_month,      null: false
      t.integer     :limit_year,       null: false
      t.integer     :security_code,    null: false
      t.references  :user,             foreign_key: true
      t.timestamps
    end
  end
end

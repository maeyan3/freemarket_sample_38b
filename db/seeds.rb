require "csv"

CSV.foreach('db/prefecture1_production.csv', headers: true) do |row|
  Prefecture.create(id: row['id'],
                  prefecture_name: row['prefecture_name']
                  )
end

CSV.foreach('db/brand1_production.csv', headers: true) do |row|
  Brand.create(id: row['id'],
                brand_name: row['brand_name']
              )
end

CSV.foreach('db/category1_production.csv', headers: true) do |row|
  Category.create(id: row['id'],
                  category_name: row['category_name'],
                  parent_id: row['parent_id']
                  )
end

CSV.foreach('db/size1_production.csv', headers: true) do |row|
  Size.create(id: row['id'],
              size_name: row['size_name'],
              parent_id: row['parent_id']
              )
end

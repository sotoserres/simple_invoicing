json.extract! item, :id, :category, :subcategory, :name, :description, :stock, :code, :barcode, :price, :supplier, :created_at, :updated_at
json.url item_url(item, format: :json)

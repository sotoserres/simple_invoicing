json.extract! invoice, :id, :company_id, :description, :quantity, :price, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)

json.extract! payment, :id, :amount, :date, :user_id, :description, :created_at, :updated_at
json.url payment_url(payment, format: :json)

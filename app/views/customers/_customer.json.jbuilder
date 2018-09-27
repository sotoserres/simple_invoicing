json.extract! customer, :id, :surname, :name, :fathername, :telephone, :cellphone, :dob, :email, :city, :address, :activity, :created_at, :updated_at
json.url customer_url(customer, format: :json)

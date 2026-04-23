json.extract! customer, :id, :name, :furigana, :birth_date, :status, :product, :created_at, :updated_at
json.url customer_url(customer, format: :json)

json.extract! posting_source, :id, :name, :description, :purchase_quantity, :quantity_type, :valid_to, :created_at, :updated_at
json.url posting_source_url(posting_source, format: :json)

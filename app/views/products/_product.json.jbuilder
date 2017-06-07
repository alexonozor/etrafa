json.extract! product, :id, :title, :place_of_origin, :size, :packings, :description, :features, :created_at, :updated_at
json.url product_url(product, format: :json)

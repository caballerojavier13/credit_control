json.array!(@sales) do |sale|
  json.extract! sale, :id, :people_id, :date
  json.url sale_url(sale, format: :json)
end

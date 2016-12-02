json.array!(@sales) do |sale|
  json.extract! sale, :id, :person_id, :date
  json.url sale_url(sale, format: :json)
end

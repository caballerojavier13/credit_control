json.array!(@sales) do |sale|
  json.extract! sale, :id, :person_id, :date
end

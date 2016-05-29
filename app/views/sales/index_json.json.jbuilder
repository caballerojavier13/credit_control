json.array!(@people) do |person|
  json.extract! person, :id, :name
  json.sales Sale.where(person_id: person.id, id: Quote.where(is_paid: false).select(:sale_id))
end

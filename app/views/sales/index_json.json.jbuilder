json.array!(@people) do |person|
  json.extract! person, :id, :name
  json.to_pay '$' + '%.2f' %  Quote.where(is_paid: false, mounth: Date.today.month, year: Date.today.year, sale_id: Sale.where(person_id: person.id).select(:id)).sum(:amount)
  json.sales(Sale.where(person_id: person.id, id: Quote.where(is_paid: false).select(:sale_id))) do |sale|
    json.extract! sale, :id, :date, :description
    json.debt '$' + '%.2f' %  Quote.where(is_paid: false, sale_id: sale.id).sum(:amount)
    json.to_pay '$' + '%.2f' %  Quote.where(is_paid: false, mounth: Date.today.month, year: Date.today.year, sale_id: sale.id).sum(:amount)
  end
end

json.extract! @sale, :id, :description, :date
json.person Person.find(@sale.person.id).name
json.quotes Quote.where(sale_id: @sale.id)


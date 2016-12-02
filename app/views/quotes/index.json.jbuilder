json.array!(@quotes) do |quote|
  json.extract! quote, :id, :number, :total, :mounth, :year, :is_pais
  json.url quote_url(quote, format: :json)
end

json.array!(@offers) do |offer|
  json.extract! offer, :id, :title, :desc, :city, :tel
  json.url offer_url(offer, format: :json)
end

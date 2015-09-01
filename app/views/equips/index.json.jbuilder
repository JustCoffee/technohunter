json.array!(@equips) do |equip|
  json.extract! equip, :id, :city, :equip_type, :brand, :model, :year, :hofuse, :status, :desc, :price
  json.url equip_url(equip, format: :json)
end

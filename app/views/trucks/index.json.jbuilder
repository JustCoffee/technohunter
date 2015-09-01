json.array!(@trucks) do |truck|
  json.extract! truck, :id, :city, :type, :brand, :model, :year, :mileage, :integer, :engine, :engv, :hofuse, :status, :desc, :price
  json.url truck_url(truck, format: :json)
end

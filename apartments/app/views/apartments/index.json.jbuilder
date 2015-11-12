json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :building_id, :user_id, :apartment_number
  json.url apartment_url(apartment, format: :json)
end

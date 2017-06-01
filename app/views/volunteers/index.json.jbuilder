json.array!(@volunteers) do |volunteer|
  json.partial! '/volunteers/volunteer', volunteer: volunteer
  json.url volunteer_url(volunteer, format: :json)
end

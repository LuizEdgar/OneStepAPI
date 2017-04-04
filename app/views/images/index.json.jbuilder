json.array!(@images) do |image|
  json.partial! '/images/image', image: image
  json.url image_url(image, format: :json)
end

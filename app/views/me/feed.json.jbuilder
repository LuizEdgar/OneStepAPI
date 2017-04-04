json.array!(@feed_items) do |feed_item|
  json.partial! '/feed_items/feed_item', feed_item: feed_item
  json.url feed_item_url(feed_item, format: :json)
end
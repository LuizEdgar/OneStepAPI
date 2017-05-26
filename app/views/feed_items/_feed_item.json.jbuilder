if feed_item.feedable_type == 'Opportunity'
  json.partial! "opportunities/opportunity", opportunity: feed_item.feedable  
elsif feed_item.feedable_type == 'Organization'
  json.partial! "organizations/organization", organization: feed_item.feedable  
end
  

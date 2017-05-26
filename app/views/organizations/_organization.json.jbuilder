json.id organization.id
json.name organization.name
json.cnpj organization.cnpj
json.verified organization.verified
json.site organization.site
json.about organization.about
json.mission organization.mission
json.size organization.size
json.established_at organization.established_at
json.feedable_type organization.feed_item.feedable_type
json.user_id organization.user_id
json.skills do
  json.partial! 'skills/skill', collection: organization.skills, as: :skill
end
json.causes do
  json.partial! 'causes/cause', collection: organization.causes, as: :cause
end
json.locations do
  json.partial! 'locations/location', collection: organization.locations, as: :location
end
json.contacts do
  json.partial! 'contacts/contact', collection: organization.contacts, as: :contact
end
json.created_at organization.created_at
json.updated_at organization.updated_at
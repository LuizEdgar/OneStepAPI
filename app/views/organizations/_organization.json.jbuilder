json.id organization.id
json.cnpj organization.cnpj
json.verified organization.verified
json.site organization.site
json.about organization.about
json.requirements organization.requirements
json.goal organization.goal
json.need organization.need
json.size organization.size
json.established_at organization.established_at
json.user_id organization.user_id
json.skills do
  json.partial! 'skills/skill', collection: organization.skills, as: :skill
end
json.causes do
  json.partial! 'causes/cause', collection: organization.causes, as: :cause
end
json.created_at organization.created_at
json.updated_at organization.updated_at
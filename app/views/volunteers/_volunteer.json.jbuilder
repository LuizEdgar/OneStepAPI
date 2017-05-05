json.id volunteer.id
json.name volunteer.name
json.about volunteer.about
json.occupation volunteer.occupation
json.gender volunteer.gender
json.period_availability volunteer.period_availability
json.volunteered volunteer.volunteered
json.cpf volunteer.cpf
json.rg volunteer.rg
json.verified volunteer.verified
json.user_id volunteer.user_id
json.skills do
  json.partial! 'skills/skill', collection: volunteer.skills, as: :skill
end
json.causes do
  json.partial! 'causes/cause', collection: volunteer.causes, as: :cause
end
json.birth_at volunteer.birth_at
json.created_at volunteer.created_at
json.updated_at volunteer.updated_at
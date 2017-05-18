json.id opportunity.id
json.title opportunity.title
json.is_ongoing opportunity.is_ongoing
json.is_virtual opportunity.is_virtual
json.volunteers_number opportunity.volunteers_number
json.start_date_at opportunity.start_date_at
json.end_date_at opportunity.end_date_at
json.start_time_at opportunity.start_time_at
json.end_time_at opportunity.end_time_at
json.description opportunity.description
json.time_commitment opportunity.time_commitment
json.others_requirements opportunity.others_requirements
json.tags opportunity.tags
json.opportunitable_type opportunity.opportunitable_type
json.opportunitable_id opportunity.opportunitable_id
json.skills do
  json.partial! 'skills/skill', collection: opportunity.skills, as: :skill
end
json.skill_ids opportunity.skills.ids
json.causes do
  json.partial! 'causes/cause', collection: opportunity.causes, as: :cause
end
json.cause_ids opportunity.causes.ids
json.locations do
  json.partial! 'locations/location', collection: opportunity.locations, as: :location
end
json.contacts do
  json.partial! 'contacts/contact', collection: opportunity.contacts, as: :contact
end
json.url opportunity_url(opportunity, format: :json)
json.created_at opportunity.created_at
json.updated_at opportunity.updated_at

#  id                  :integer          not null, primary key
#  title               :string
#  is_ongoing          :boolean
#  is_virtual          :boolean
#  volunteers_number   :integer
#  start_date_at       :date
#  end_date_at         :date
#  start_time_at       :time
#  end_time_at         :time
#  description         :text
#  time_commitment     :string
#  others_requirements  :string
#  tags                :string
#  opportunitable_type :string
#  opportunitable_id   :integer

json.id opportunity.id
json.title opportunity.title
json.is_ongoing opportunity.is_ongoing
json.is_virtual opportunity.is_virtual
json.volunteers_number opportunity.volunteers_number
json.start_at opportunity.start_at
json.end_at opportunity.end_at
json.start_date_set opportunity.start_date_set
json.end_date_set opportunity.end_date_set
json.start_time_set opportunity.start_time_set
json.end_time_set opportunity.end_time_set
json.description opportunity.description
json.time_commitment opportunity.time_commitment
json.others_requirements opportunity.others_requirements
json.tags opportunity.tags
json.opportunitable_type opportunity.opportunitable_type
json.opportunitable do
    json.id opportunity.opportunitable.id
    json.name opportunity.opportunitable.name
    json.profile_image do
      if opportunity.opportunitable.profile_image.present?
        json.partial! '/images/image', image: opportunity.opportunitable.profile_image
      else
        json.null!
      end
    end
end
json.feedable_type opportunity.feed_item.feedable_type
json.images do
  json.partial! 'images/image', collection: opportunity.images.order(:created_at), as: :image
end
json.skills do
  json.partial! 'skills/skill', collection: opportunity.skills, as: :skill
end
json.skill_ids opportunity.skills.ids
json.causes do
  json.partial! 'causes/cause', collection: opportunity.causes, as: :cause
end
json.cause_ids opportunity.causes.ids
unless opportunity.location.nil?
  json.location do
    json.partial! 'locations/location', location: opportunity.location
  end  
end
unless opportunity.contact.nil?
  json.contact do
    json.partial! 'contacts/contact', contact: opportunity.contact
  end
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

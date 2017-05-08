json.extract! opportunity, :id, :title, :volunteers_number, :description, :time_commitment, :requirements, :opportunitable_id, :opportunitable_type, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)

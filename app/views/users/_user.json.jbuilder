json.id user.id
json.email user.email
json.username user.username
json.auth user.auth
json.facebook_id user.facebook_id
json.kind user.kind
if user.volunteer?
  json.volunteer do
    json.partial! 'volunteers/volunteer', volunteer: user.volunteer
  end
end
if user.organization?
  json.organization do
    json.partial! 'organizations/organization', organization: user.organization
  end
end
# json.profile_image do
  # if user.profile_image.present?
      # json.partial! '/images/image', image: user.profile_image
    # else
      # json.null!
  # end
# end
json.created_at user.created_at
json.updated_at user.updated_at
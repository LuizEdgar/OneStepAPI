json.id user.id
json.name user.name
# json.nickname user.nickname
json.email user.email
# json.voting_number user.voting_number
# json.party user.party
# json.city user.city
# json.state user.state
# json.office user.office
json.auth user.auth
# json.profile_image do
  # if user.profile_image.present?
      # json.partial! '/images/image', image: user.profile_image
    # else
      # json.null!
  # end
# end
json.created_at user.created_at
json.updated_at user.updated_at
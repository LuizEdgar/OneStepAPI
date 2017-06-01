json.array!(@organizations) do |organization|
  json.partial! '/organizations/organization', organization: organization
  json.url organization_url(organization, format: :json)
end

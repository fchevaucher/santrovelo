json.array!(@members) do |member|
  json.extract! member, :id, :first_name, :last_name, :email, :phone_number, :policies_acceptance
  json.url member_url(member, format: :json)
end

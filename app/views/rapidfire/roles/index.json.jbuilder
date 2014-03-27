json.array!(@rapidfire_roles) do |rapidfire_role|
  json.extract! rapidfire_role, :id, :name
  json.url rapidfire_role_url(rapidfire_role, format: :json)
end

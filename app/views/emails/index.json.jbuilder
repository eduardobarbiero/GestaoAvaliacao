json.array!(@emails) do |email|
  json.extract! email, :id, :titulo, :corpo
  json.url email_url(email, format: :json)
end

json.array!(@candidatos) do |candidato|
  json.extract! candidato, :id, :nome, :email
  json.url candidato_url(candidato, format: :json)
end

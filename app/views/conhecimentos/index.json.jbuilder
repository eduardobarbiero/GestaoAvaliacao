json.array!(@conhecimentos) do |conhecimento|
  json.extract! conhecimento, :id, :nome, :minima, :maxima, :obrigatorio
  json.url conhecimento_url(conhecimento, format: :json)
end

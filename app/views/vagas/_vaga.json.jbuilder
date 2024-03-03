json.extract! vaga, :id, :nome, :descricao, :salario, :empregador_id, :created_at, :updated_at
json.url vaga_url(vaga, format: :json)

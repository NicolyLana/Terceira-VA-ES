json.extract! candidato, :id, :nome, :email, :cpf, :dataDeNascimento, :telefone, :created_at, :updated_at
json.url candidato_url(candidato, format: :json)

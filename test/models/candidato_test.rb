require "test_helper"

class CandidatoTest < ActiveSupport::TestCase
  test 'deve cadastrar um candidato com dados válidos' do
    candidato = Candidato.new(nome: 'Ricardo Oliveira', email: 'ricardo@email.com',
                              cpf: '96872396032', dataDeNascimento: '30/08/1999', telefone: '87958854774')
    assert candidato.save
  end

  test 'não deve cadastrar um candidato com dados inválidos' do
    candidato = Candidato.new(nome: 'Ricardo Oliveira', email: 'ricardo@email.com',
                              cpf: '', dataDeNascimento: '30/08/1999', telefone: '8795885')
    assert_not candidato.save
  end
end


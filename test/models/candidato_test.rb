require "test_helper"

class CandidatoTest < ActiveSupport::TestCase
  test 'Cadastrar um candidato com dados validos' do
    candidato = Candidato.new nome: 'Ricardo Oliveira', email: 'ricardo@email.com',
                              cpf: '96872396032', dataDeNascimento: '30/08/1999', telefone: '87958854774'
    assert candidato.save
  end

  test 'Cadastrar um candidato com dados invalidos' do
    candidato = Candidato.new nome: 'Ricardo Oliveira', email: 'ricardo@email.com',
                              cpf: '', dataDeNascimento: '30/08/1999', telefone: '87958854774'
    assert_not candidato.save
  end
end

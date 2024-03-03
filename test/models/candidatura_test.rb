require "test_helper"

class CandidaturaTest < ActiveSupport::TestCase
  test 'Cadastrar uma candidatura com dados validos' do
    candidato = Candidato.new nome: 'Ricardo Oliveira', email: 'ricardo@email.com',
                              cpf: '96872396032', dataDeNascimento: '30/08/1999', telefone: '87958854774'
    assert candidato.save
    empregador = Empregador.new nome: 'Marcia Cristina', nomeEmpresa: 'Alelo Produções', email: 'alelo@email.com',
                                endereco: 'Rua acostamento, 657', telefone: '11948842332', cnpj: '51.489.289/0001-95'
    assert empregador.save

    vaga = Vaga.new nome: 'Dev pleno', descricao: 'Vaga para dev', salario: '8000', empregador_id: empregador.id

    assert vaga.save

    candidatura = Candidatura.new mensagem: 'Possuo experiencia', candidato_id: candidato.id,
                                  vaga_id: vaga.id, empregador_id: empregador.id
    assert candidatura.save
  end

  test 'Tentar cadastrar uma candidatura com dados invalidos' do
    candidato = Candidato.new nome: 'Ricardo Oliveira', email: 'ricardo@email.com',
                              cpf: '96872396032', dataDeNascimento: '30/08/1999', telefone: '87958854774'
    assert candidato.save
    empregador = Empregador.new nome: 'Marcia Cristina', nomeEmpresa: 'Alelo Produções', email: 'alelo@email.com',
                                endereco: 'Rua acostamento, 657', telefone: '11948842332', cnpj: '51.489.289/0001-95'
    assert empregador.save

    vaga = Vaga.new nome: 'Dev pleno', descricao: 'Vaga para dev', salario: '8000', empregador_id: empregador.id

    assert vaga.save

    candidatura = Candidatura.new mensagem: '', candidato_id: '',
                                  vaga_id: vaga.id, empregador_id: empregador.id
    assert_not candidatura.save
  end
end

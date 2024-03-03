require "test_helper"

class VagaTest < ActiveSupport::TestCase
  test 'Cadastrar uma vaga com dados validos' do
    empregador = Empregador.new nome: 'Marcia Cristina', nomeEmpresa: 'Alelo Produções', email: 'alelo@email.com',
                                endereco: 'Rua acostamento, 657', telefone: '11948842332', cnpj: '51.489.289/0001-95'
    assert empregador.save

    vaga = Vaga.new nome: 'Dev pleno', descricao: 'Vaga para dev', salario: '8000', empregador_id: empregador.id

    assert vaga.save
  end

  test 'Tentar editar uma vaga com dados invalidos' do
    empregador = Empregador.new nome: 'Marcia Cristina', nomeEmpresa: 'Alelo Produções', email: 'alelo@email.com',
                                endereco: 'Rua acostamento, 657', telefone: '11948842332', cnpj: '51.489.289/0001-95'
    assert empregador.save

    vaga = Vaga.new nome: 'Dev pleno', descricao: '', salario: 'aqui', empregador_id: empregador.id

    assert_not vaga.save
  end
end

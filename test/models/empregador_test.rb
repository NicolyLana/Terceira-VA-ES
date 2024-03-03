require "test_helper"

class EmpregadorTest < ActiveSupport::TestCase
  test 'Cadastrar um empregador com dados validos' do
    empregador = Empregador.new nome: 'Marcia Cristina', nomeEmpresa: 'Alelo Produções', email: 'alelo@email.com',
                              endereco: 'Rua acostamento, 657', telefone: '11948842332', cnpj: '51.489.289/0001-95'
    assert empregador.save
  end

  test 'Deletar um empregador com sucesso' do
    empregador = Empregador.new nome: 'Ana Vitoria', nomeEmpresa: 'Eletro', email: 'eletro@email.com',
                                endereco: 'Rua das flores, 1991', telefone: '11933335775', cnpj: '12.041.072/0001-66'

    assert empregador.save
    assert Empregador.exists?(empregador.id), 'Empregador não foi salvo corretamente no banco de dados'

    empregador.destroy
    assert_not Empregador.exists?(empregador.id), 'Empregador não foi removido corretamente do banco de dados'
  end

  test 'Tentar cdastrar um empregador com dados invalidos' do
    empregador = Empregador.new nome: 'Mar', nomeEmpresa: 'Alelo Produções', email: 'alelo@email.com',
                                endereco: 'Rua acostamento, 657', telefone: '11948842332', cnpj: ''
    assert_not empregador.save
  end

end

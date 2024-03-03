Feature: Empregador
  as a empregador
  I want to adicionar, remover, visualizar, e editar um empregador
  So that mantenho o cadastro atualizado e correto


  Scenario: Criar empregador com sucesso
    Given que eu estou na pagina de cadastro do Empregador
    And prencho o campo nome do empregador com "Maria Silva"
    And prencho o campo nome da empresa com "Empresa XYZ"
    And prencho o campo email do empregador com "maria.silva@example.com"
    And prencho o campo endereço com "Rua A, 123"
    And prencho o campo telefone do empregador com "11555555555"
    And prencho o campo cnpj com "12.345.678/0001-00"
    When clico em "Salvar"
    Then vejo a mensagem "Empregador cadastrado com sucesso."

  Scenario: Atualizar empregador com sucesso
    Given O empregador de nome: "Maria Silva", nomeEmpresa: "Empresa XYZ", email: 'maria.silva@example.com', endereco: 'Rua A, 123', telefone: '11-55555-5555', cnpj: '12.345.678/0001-01' existe
    And estou na pagina de empregadores
    And clico em Detalhes do empregador do empregador cadastrado
    And eu acesso a pagina de edicao do empregador "Maria Silva"
    And prencho o campo email do empregador com "maria.silva023@example.com"
    And prencho o campo nome da empresa com "Empresa ABC"
    When clico em "Salvar"
    Then vejo a mensagem "Empregador editado com sucesso."


  Scenario: Excluir empregador com sucesso
    Given O empregador de nome: "Maria Silva", nomeEmpresa: "Empresa XYZ", email: 'maria.silva@example.com', endereco: 'Rua A, 123', telefone: '11-55555-5555', cnpj: '12.345.678/0001-02' existe
    And estou na pagina de empregadores
    And clico em Detalhes do empregador do empregador cadastrado
    When eu clico no botao "Deletar"
    Then vejo a mensagem "Empregador deletado com sucesso"

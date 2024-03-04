Feature: gerenciar uma candidatura
  As a candidato
  I want to candidatar em uma vaga  no site de emprego
  So that eu possa  concorrer a uma vaga

  Scenario: Criar uma candidatura com sucesso
    Given que existe um candidato chamado "Wilker" com e-mail "joao@hotmail.com", o cpf "11598786427", a data "20/11/2001", o seguinte numero "87999469995"
    And  que existe um empregador chamado "Paulo" com a empresa "Empresa ABC", o email "paulo@example.com", o endereco "Rua ponte", o telefone "87999459896", o cnpj "44.935.624/0001-60"
    And  que exite uma vaga de emprego: Titulo: "Dev pleno ruby on rails", Descricao: "Candidato confiante" e Salario: "2500", para o empregador "Paulo"
    When  acesso a pagina de cadastro da candidatura
    And preencho a mensagem de candidatura com "Tenho experiencia com ruby on rails"
    And seleciono a vaga "Dev pleno ruby on rails"
    And seleciono o candidato "Wilker"
    And seleciono o empregador "Paulo"
    And clico em "Salvar"
    Then vejo a mensagem "Candidatura cadastrada com sucesso."

  Scenario: Tentar criar uma candidatura com informacoes invalidas
    Given que existe um candidato chamado "Phellipe" com e-mail "joaov@outlookcom", o cpf "06698786427", a data "20/11/2001", o seguinte numero "87999469995"
    And  que existe um empregador chamado "Paulo" com a empresa "Empresa ABC", o email "paulo@example.com", o endereco "Rua ponte", o telefone "87999459896", o cnpj "44.935.624/0001-54"
    And  que exite uma vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Candidato triste" e Salario: "5800", para o empregador "Paulo"
    When  acesso a pagina de cadastro da candidatura
    And seleciono a vaga "Dev junior ruby on rails"
    And seleciono o candidato "Phellipe"
    And seleciono o empregador "Paulo"
    And clico em "Salvar"
    Then vejo a mensagem "Mensagem can't be blank"

  Scenario: Editar uma candidatura com sucesso
    Given que existe uma candidatura para a vaga "Dev senior ruby on rails" feita pelo candidato "Jose Mario", empregador "ze pitomba" e a mensagem de candidatura com "Tenho experiencia com ruby on rails"
    And eu estou na pagina de listagem de candidaturas
    When eu clico em Detalhes da candidatura da candidatura cadastrada
    And eu acesso a pagina de edicao da candidatura do candidato "Jose Mario"
    And altero a mensagem de candidatura para "Tenho mais de 2 anos de experiencia com ruby on rails"
    And clico em "Salvar"
    Then vejo a mensagem "Candidatura editada com sucesso."

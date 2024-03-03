Feature: Candidato
  As a candidato
  I want to criar, deletar ou editar cadastro
  So that mantenho o cadastro atualizado e correto

  #CRIAR CADASTRO
  Scenario: Criar cadastro com informacoes validas
    Given que eu estou na pagina de cadastro de candidato
    And prencho o campo nome com "Giselli Maria da Silva"
    And prencho o campo email com "giselli@teste.com"
    And prencho o campo cpf com "28821365018"
    And prencho o campo data de nascimento com "18/02/2003"
    And prencho o campo telefone com "81956652552"
    When clico em "Salvar"
    Then vejo a mensagem "Candidato cadastrado com sucesso."

  Scenario: Remover candidato com sucesso
    Given que existe um candidato com nome: 'João Ribeiro', email: 'joao.silva@example.com', cpf: '05502727041', data de nascimento '22/02/2002', telefone: '81944444444'
    And eu estou na pagina de listagem de candidatos
    And clico em Detalhes do candidato do candidato cadastrado
    When eu clico no botão "Deletar"
    Then vejo a mensagem "Candidato deletado com sucesso."

  Scenario: Criar cadastro com informacoes invalidas
    Given que eu estou na pagina de cadastro de candidato
    And prencho o campo nome com "Gis"
    And prencho o campo email com "giselli@teste.com"
    And prencho o campo cpf com "28821365018"
    And prencho o campo data de nascimento com "18/02/2025"
    And prencho o campo telefone com "81956652552"
    When clico em "Salvar"
    Then vejo a mensagem "Nome é muito curto (mínimo é 5 caracter)"
    And vejo a mensagem "Datadenascimento não pode ser no futuro"


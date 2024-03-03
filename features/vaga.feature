Feature: Vaga
  As a empregador
  I want to adicionar, remover, visualizar, e editar uma vaga
  So that mantenho o cadastro atualizado e correto

   #Criar vaga
  Scenario: Criar vaga com sucesso
    Given O empregador de nomeEmpresa: "Empresa ABC", nome: "João da Silva", endereco: 'Rua B, 456', email: 'joao.silva@example.com', cnpj: '98.765.432/0001-99', telefone: '11-44444-4444' existe
    And que eu esteja na pagina de criacao de vaga
    And eu preencho o campo nome com "Desenvolvedor Ruby"
    And eu preencho o campo descricao com "Vaga para desenvolvedor Ruby"
    And eu preencho o campo salario: R$ "5000"
    And eu seleciono o empregador "João da Silva"
    When eu clico em "Salvar"
    Then eu devo ser redirecionado para a pagina da vaga "Desenvolvedor Ruby" recem-criada
    And vejo a mensagem "Vaga cadastrada com sucesso."

   #Remover vaga
  Scenario: Remover vaga com sucesso
    Given que existe uma vaga de titulo: 'Desenvolvedor Ruby', descricao: 'Vaga para desenvolvedor Ruby', salario: '5000' para o empregador "Joao Silva"
    And eu estou na pagina de listagem de vagas
    And clico em "Detalhes da vaga" da vaga "Desenvolvedor Ruby"
    When eu clico no botao "Deletar"
    Then vejo a mensagem "Vaga deletada com sucesso."

   #Editar vaga
  Scenario: Editar vaga com sucesso
    Given que existe uma vaga de titulo: 'Desenvolvedor Ruby', descricao: 'Vaga para desenvolvedor Ruby', salario: '5000' para o empregador "Joao Silva"
    And eu estou na pagina de listagem de vagas
    When eu clico em Detalhes da vaga da vaga cadastrada
    And eu acesso a pagina de edicao da vaga "Desenvolvedor Ruby"
    And eu altero o campo de descricao com "Vaga para desenvolvedor Ruby on Rails"
    And clico em "Salvar"
    Then vejo a mensagem "Vaga editada com sucesso."

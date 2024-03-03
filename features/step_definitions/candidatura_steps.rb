Given('que existe um candidato chamado {string} com e-mail {string}, o cpf {string}, a data {string}, o seguinte numero {string}') do |nome, email, cpf, data, telefone|
  visit '/candidatos/new'
  expect(page).to have_current_path('/candidatos/new')

  fill_in 'candidato[nome]', with: nome
  fill_in 'candidato[email]', with: email
  fill_in 'candidato[cpf]', with: cpf
  fill_in 'candidato[dataDeNascimento]', with: data
  fill_in 'candidato[telefone]', with: telefone

  click_button 'Salvar'
  expect(page).to have_content(nome)
end

Given('que existe um empregador chamado {string} com a empresa {string}, o email {string}, o endereco {string}, o telefone {string}, o cnpj {string}') do |nome, nomeEmpresa, email, endereco, telefone, cnpj|
  visit '/empregadors/new'
  expect(page).to have_current_path('/empregadors/new')

  fill_in 'empregador[nomeEmpresa]', with: nomeEmpresa
  fill_in 'empregador[nome]', with: nome
  fill_in 'empregador[endereco]', with: endereco
  fill_in 'empregador[email]', with: email
  fill_in 'empregador[cnpj]', with: cnpj
  fill_in 'empregador[telefone]', with: telefone.gsub(/[^\d]/, '')

  click_button 'Salvar'
  expect(page).to have_content(nome)
end

Given('que exite uma vaga de emprego: Titulo: {string}, Descricao: {string} e Salario: {string}, para o empregador {string}') do |titulo, descricao, salario, empregador|
  visit '/vagas/new'
  expect(page).to have_current_path('/vagas/new')

  fill_in 'vaga[nome]', with: titulo
  fill_in 'vaga[descricao]', with: descricao
  fill_in 'vaga[salario]', with: salario
  select empregador, from: 'vaga[empregador_id]'

  click_button 'Salvar'
  expect(page).to have_content(titulo)
end

When('acesso a pagina de cadastro da candidatura') do
  visit 'candidaturas/new'
  expect(page).to have_current_path('/candidaturas/new')
end

When('preencho a mensagem de candidatura com {string}') do |mensagem|
  fill_in 'candidatura[mensagem]', :with => mensagem
end
When('seleciono o empregador {string}') do |empregador|
  select empregador, from: 'candidatura[empregador_id]'
end

When('seleciono a vaga {string}') do |vaga|
  select vaga, from: 'candidatura[vaga_id]'
end

When('seleciono o candidato {string}') do |candidato|
  select candidato, from: 'candidatura[candidato_id]'
end

Given('que existe uma candidatura para a vaga {string} feita pelo candidato {string}, empregador {string} e a mensagem de candidatura com {string}') do |vaga, candidato, empregador, mensagem|

  visit '/candidatos/new'
  expect(page).to have_current_path('/candidatos/new')

  fill_in 'candidato[nome]', with: candidato
  fill_in 'candidato[email]', with: 'jose@email.com'
  fill_in 'candidato[cpf]', with: '58542331001'
  fill_in 'candidato[dataDeNascimento]', with: '08/08/2000'
  fill_in 'candidato[telefone]', with: '87965563223'

  click_button 'Salvar'
  expect(page).to have_content(candidato)


  visit '/empregadors/new'
  expect(page).to have_current_path('/empregadors/new')

  fill_in 'empregador[nomeEmpresa]', with: 'Empresa ABC'
  fill_in 'empregador[nome]', with: empregador
  fill_in 'empregador[endereco]', with: 'Rua B, 456'
  fill_in 'empregador[email]', with: 'joao.silva@example.com'
  fill_in 'empregador[cnpj]', with: '98.765.432/0001-99'
  fill_in 'empregador[telefone]', with: '11444444444'

  click_button 'Salvar'
  expect(page).to have_content(empregador)

  visit '/vagas/new'
  expect(page).to have_current_path('/vagas/new')

  fill_in 'vaga[nome]', with: vaga
  fill_in 'vaga[descricao]', with: 'Vaga para desenvolvedor Ruby'
  fill_in 'vaga[salario]', with: '7000'
  select empregador, from: 'vaga[empregador_id]'

  click_button 'Salvar'
  expect(page).to have_content(vaga)

  visit 'candidaturas/new'
  expect(page).to have_current_path('/candidaturas/new')

  fill_in 'candidatura[mensagem]', :with => 'Tenho experiencia com ruby on rails'
  select vaga, from: 'candidatura[vaga_id]'
  select candidato, from: 'candidatura[candidato_id]'
  select empregador, from: 'candidatura[empregador_id]'

  click_button 'Salvar'
  expect(page).to have_content(vaga)
  expect(page).to have_content(candidato)
  expect(page).to have_content(empregador)
end

Given('eu estou na pagina de listagem de candidaturas') do
  visit '/candidaturas'
  expect(page).to have_current_path('/candidaturas')
end

When('eu clico em Detalhes da candidatura da candidatura cadastrada') do
  within("#candidaturas") do
    find("a", text: "Detalhes da candidatura", match: :first).click
  end
end

When('eu acesso a pagina de edicao da candidatura do candidato {string}') do |candidato|
  candidatura = Candidatura.find_by(candidato_id: Candidato.find_by(nome: candidato))
  visit edit_candidatura_path(candidatura)
end

When('altero a mensagem de candidatura para {string}') do |novaMensagem|
  fill_in 'candidatura[mensagem]', :with => novaMensagem
end

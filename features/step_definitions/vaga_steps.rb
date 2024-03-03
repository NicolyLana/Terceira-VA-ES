Given('O empregador de nomeEmpresa: {string}, nome: {string}, endereco: {string}, email: {string}, cnpj: {string}, telefone: {string} existe') do |nomeEmpresa, nome, endereco, email, cnpj, telefone|
  visit '/empregadors/new'
  expect(page).to have_current_path('/empregadors/new')

  fill_in 'empregador[nomeEmpresa]', with: nomeEmpresa
  fill_in 'empregador[nome]', with: nome
  fill_in 'empregador[endereco]', with: endereco
  fill_in 'empregador[email]', with: email
  fill_in 'empregador[cnpj]', with: cnpj
  fill_in 'empregador[telefone]', with: telefone.gsub(/[^\d]/, '') # Remova caracteres não numéricos

  click_button 'Salvar'
  expect(page).to have_content(nome)
end



Given('que eu esteja na pagina de criacao de vaga') do
  visit 'vagas/new'
  expect(page).to have_current_path('/vagas/new')
end

Given('eu preencho o campo nome com {string}') do |nome|
  fill_in 'vaga[nome]', with: nome
end

Given('eu preencho o campo descricao com {string}') do |descricao|
  fill_in 'vaga[descricao]', :with => descricao
end

Given('eu preencho o campo salario: R$ {string}') do |salario|
  fill_in 'vaga[salario]', :with => salario
end

Given('eu seleciono o empregador {string}') do |nomeEmpregador|
  select nomeEmpregador, from: 'vaga[empregador_id]'
end

When('eu clico em {string}') do |botao|
  click_button botao
end


Then('eu devo ser redirecionado para a pagina da vaga {string} recem-criada') do |nome|
  expect(page).to have_content(nome)
end

Then('vejo a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end


Given('que existe uma vaga de titulo: {string}, descricao: {string}, salario: {string} para o empregador {string}') do |titulo, descricao, salario, nomeEmpregador|
  visit '/empregadors/new'
  expect(page).to have_current_path('/empregadors/new')

  fill_in 'empregador[nomeEmpresa]', with: 'Empresa ABC'
  fill_in 'empregador[nome]', with: nomeEmpregador
  fill_in 'empregador[endereco]', with: 'Rua B, 456'
  fill_in 'empregador[email]', with: 'joao.silva@example.com'
  fill_in 'empregador[cnpj]', with: '98.765.432/0001-99'
  fill_in 'empregador[telefone]', with: '11444444444' # ou o valor que você deseja

  click_button 'Salvar'
  expect(page).to have_content(nomeEmpregador)

  visit '/vagas/new'
  expect(page).to have_current_path('/vagas/new')

  fill_in 'vaga[nome]', with: titulo
  fill_in 'vaga[descricao]', with: descricao
  fill_in 'vaga[salario]', with: salario
  select nomeEmpregador, from: 'vaga[empregador_id]'

  click_button 'Salvar'
  expect(page).to have_content(titulo)
end



Given('eu estou na pagina de listagem de vagas') do
  visit '/vagas' # Certifique-se de ajustar o caminho conforme necessário
  expect(page).to have_current_path('/vagas') # Verifique se a página de listagem de vagas está correta
end


When('clico em "Detalhes da vaga" da vaga {string}') do |vaga_nome|
  vaga = Vaga.find_by(nome: vaga_nome)
  within("#vagas") do
    find("a", text: "Detalhes da vaga", match: :first).click
  end
end

When('eu clico no botao {string}') do |botao|
  click_button botao
end

When('eu acesso a pagina de edicao da vaga {string}') do |nome|
  vaga = Vaga.find_by(nome: nome)
  visit edit_vaga_path(vaga)
end

When('eu clico em "Detalhes da vaga" da vaga {string}') do |vaga_nome|
  vaga = Vaga.find_by(nome: vaga_nome)
  within("#vagas") do
    find("a", text: "Detalhes da vaga", match: :first).click
  end
end

When('eu altero o campo de descricao com {string}') do |novaDescricao|
  fill_in 'vaga[descricao]', with: novaDescricao
end


When('clico em {string}') do |nomeBotao|
  click_button nomeBotao
end


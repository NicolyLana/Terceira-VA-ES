Given('que eu estou na pagina de cadastro do Empregador') do
  visit 'empregadors/new'
  expect(page).to have_current_path('/empregadors/new')
end

Given('prencho o campo nome da empresa com {string}') do |nomeEmpresa|
  fill_in 'empregador[nomeEmpresa]', with: nomeEmpresa
end

Given('prencho o campo endereço com {string}') do |endereco|
  fill_in 'empregador[endereco]', with: endereco
end

Given('prencho o campo cnpj com {string}') do |cnpj|
  fill_in 'empregador[cnpj]', with: cnpj
end

Given('prencho o campo nome do empregador com {string}') do |nome|
  fill_in 'empregador[nome]', with: nome
end

Given('prencho o campo email do empregador com {string}') do |email|
  fill_in 'empregador[email]', with: email
end

Given('prencho o campo telefone do empregador com {string}') do |telefone|
  fill_in 'empregador[telefone]', with: telefone
end

Given('O empregador de nome: {string}, nomeEmpresa: {string}, email: {string}, endereco: {string}, telefone: {string}, cnpj: {string} existe') do |nome, nomeEmpresa, email, endereco, telefone, cnpj|
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

Given('estou na pagina de empregadores') do
  visit '/empregadors'
  expect(page).to have_current_path('/empregadors')
end

Given('clico em Detalhes do empregador do empregador cadastrado') do
  within("#empregadors") do
    find("a", text: "Detalhes do empregador", match: :first).click
  end
end

Given('eu acesso a pagina de edicao do empregador {string}') do |nome|
  empregador = Empregador.find_by(nome: nome)
  visit edit_empregador_path(empregador)
end

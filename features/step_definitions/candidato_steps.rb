Given('que eu estou na pagina de cadastro de candidato') do
  visit 'candidatos/new'
  expect(page).to have_current_path('/candidatos/new')
end

Given('prencho o campo nome com {string}') do |nome|
  fill_in 'candidato[nome]', with: nome
end

Given('prencho o campo email com {string}') do |email|
  fill_in 'candidato[email]', with: email
end

Given('prencho o campo cpf com {string}') do |cpf|
  fill_in 'candidato[cpf]', with: cpf
end

Given('prencho o campo data de nascimento com {string}') do |data|
  fill_in 'candidato[dataDeNascimento]', with: data
end

Given('prencho o campo telefone com {string}') do |telefone|
  fill_in 'candidato[telefone]', with: telefone
end

Given('que existe um candidato com nome: {string}, email: {string}, cpf: {string}, data de nascimento {string}, telefone: {string}') do |nome, email, cpf, data, telefone|
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

Given('eu estou na pagina de listagem de candidatos') do
  visit '/candidatos'
  expect(page).to have_current_path('/candidatos')
end

Given('clico em Detalhes do candidato do candidato cadastrado') do
  within("#candidatos") do
    find("a", text: "Detalhes do candidato", match: :first).click
  end
end




class Empregador < ApplicationRecord

  validates :nome, presence: true, length: { in: 5..50 }
  validates :nomeEmpresa, presence: true, length: { in: 5..80 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :endereco, presence: true
  validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'deve ter 10 ou 11 dígitos numéricos' }
  validates :cnpj, presence: true, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: "formato de CNPJ inválido" }

end

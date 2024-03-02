class Candidato < ApplicationRecord
  validates :nome, presence: true, length: { in: 5..40 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :data_nascimento_valida
  validates :cpf, presence: true, uniqueness: true, length: {is: 11}, numericality: { only_integer:true }
  validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'deve ter 10 ou 11 dígitos numéricos' }

  def data_nascimento_valida
    if dataDeNascimento.present? && dataDeNascimento > Date.today
      errors.add(:dataDeNascimento, "não pode ser no futuro")
    end
  end
end

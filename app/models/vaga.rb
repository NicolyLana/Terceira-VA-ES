class Vaga < ApplicationRecord

  validates :nome, presence: true, length: { in: 5..40 }
  validates :descricao, presence: true
  validates :salario, presence: true, numericality: { greater_than: 0 }

end

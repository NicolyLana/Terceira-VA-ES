class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga
  belongs_to :empregador

  validates :mensagem, presence: true
end

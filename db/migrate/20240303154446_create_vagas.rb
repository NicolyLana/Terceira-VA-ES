class CreateVagas < ActiveRecord::Migration[7.0]
  def change
    create_table :vagas do |t|
      t.string :nome
      t.text :descricao
      t.decimal :salario
      t.references :empregador, null: false, foreign_key: true

      t.timestamps
    end
  end
end

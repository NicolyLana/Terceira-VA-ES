# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_03_03_154535) do
  create_table "candidatos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.date "dataDeNascimento"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidaturas", force: :cascade do |t|
    t.text "mensagem"
    t.integer "candidato_id", null: false
    t.integer "vaga_id", null: false
    t.integer "empregador_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidato_id"], name: "index_candidaturas_on_candidato_id"
    t.index ["empregador_id"], name: "index_candidaturas_on_empregador_id"
    t.index ["vaga_id"], name: "index_candidaturas_on_vaga_id"
  end

  create_table "empregadors", force: :cascade do |t|
    t.string "nome"
    t.string "nomeEmpresa"
    t.string "email"
    t.string "endereco"
    t.string "telefone"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vagas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.decimal "salario"
    t.integer "empregador_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empregador_id"], name: "index_vagas_on_empregador_id"
  end

  add_foreign_key "candidaturas", "candidatos"
  add_foreign_key "candidaturas", "empregadors"
  add_foreign_key "candidaturas", "vagas"
  add_foreign_key "vagas", "empregadors"
end

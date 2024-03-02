require "application_system_test_case"

class CandidaturasTest < ApplicationSystemTestCase
  setup do
    @candidatura = candidaturas(:one)
  end

  test "visiting the index" do
    visit candidaturas_url
    assert_selector "h1", text: "Candidaturas"
  end

  test "should create candidatura" do
    visit candidaturas_url
    click_on "New candidatura"

    fill_in "Candidato", with: @candidatura.candidato_id
    fill_in "Empregador", with: @candidatura.empregador_id
    fill_in "Vaga", with: @candidatura.vaga_id
    click_on "Create Candidatura"

    assert_text "Candidatura was successfully created"
    click_on "Back"
  end

  test "should update Candidatura" do
    visit candidatura_url(@candidatura)
    click_on "Edit this candidatura", match: :first

    fill_in "Candidato", with: @candidatura.candidato_id
    fill_in "Empregador", with: @candidatura.empregador_id
    fill_in "Vaga", with: @candidatura.vaga_id
    click_on "Update Candidatura"

    assert_text "Candidatura was successfully updated"
    click_on "Back"
  end

  test "should destroy Candidatura" do
    visit candidatura_url(@candidatura)
    click_on "Destroy this candidatura", match: :first

    assert_text "Candidatura was successfully destroyed"
  end
end

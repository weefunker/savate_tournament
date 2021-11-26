require "application_system_test_case"

class FightersTest < ApplicationSystemTestCase
  setup do
    @fighter = fighters(:one)
  end

  test "visiting the index" do
    visit fighters_url
    assert_selector "h1", text: "Fighters"
  end

  test "creating a Fighter" do
    visit fighters_url
    click_on "New Fighter"

    fill_in "Fighter age", with: @fighter.fighter_age
    fill_in "Fighter experience", with: @fighter.fighter_experience
    fill_in "Fighter gender", with: @fighter.fighter_gender
    fill_in "Fighter height", with: @fighter.fighter_height
    fill_in "Fighter name", with: @fighter.fighter_name
    fill_in "Fighter score", with: @fighter.fighter_score
    fill_in "Fighter skill", with: @fighter.fighter_skill
    fill_in "Fighter weight", with: @fighter.fighter_weight
    click_on "Create Fighter"

    assert_text "Fighter was successfully created"
    click_on "Back"
  end

  test "updating a Fighter" do
    visit fighters_url
    click_on "Edit", match: :first

    fill_in "Fighter age", with: @fighter.fighter_age
    fill_in "Fighter experience", with: @fighter.fighter_experience
    fill_in "Fighter gender", with: @fighter.fighter_gender
    fill_in "Fighter height", with: @fighter.fighter_height
    fill_in "Fighter name", with: @fighter.fighter_name
    fill_in "Fighter score", with: @fighter.fighter_score
    fill_in "Fighter skill", with: @fighter.fighter_skill
    fill_in "Fighter weight", with: @fighter.fighter_weight
    click_on "Update Fighter"

    assert_text "Fighter was successfully updated"
    click_on "Back"
  end

  test "destroying a Fighter" do
    visit fighters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fighter was successfully destroyed"
  end
end

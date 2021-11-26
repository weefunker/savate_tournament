require "application_system_test_case"

class TournamentEventsTest < ApplicationSystemTestCase
  setup do
    @tournament_event = tournament_events(:one)
  end

  test "visiting the index" do
    visit tournament_events_url
    assert_selector "h1", text: "Tournament Events"
  end

  test "creating a Tournament event" do
    visit tournament_events_url
    click_on "New Tournament Event"

    fill_in "Total contestants", with: @tournament_event.total_contestants
    fill_in "Tournament date", with: @tournament_event.tournament_date
    click_on "Create Tournament event"

    assert_text "Tournament event was successfully created"
    click_on "Back"
  end

  test "updating a Tournament event" do
    visit tournament_events_url
    click_on "Edit", match: :first

    fill_in "Total contestants", with: @tournament_event.total_contestants
    fill_in "Tournament date", with: @tournament_event.tournament_date
    click_on "Update Tournament event"

    assert_text "Tournament event was successfully updated"
    click_on "Back"
  end

  test "destroying a Tournament event" do
    visit tournament_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tournament event was successfully destroyed"
  end
end

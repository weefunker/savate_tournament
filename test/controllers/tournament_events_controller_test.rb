require "test_helper"

class TournamentEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament_event = tournament_events(:one)
  end

  test "should get index" do
    get tournament_events_url
    assert_response :success
  end

  test "should get new" do
    get new_tournament_event_url
    assert_response :success
  end

  test "should create tournament_event" do
    assert_difference('TournamentEvent.count') do
      post tournament_events_url, params: { tournament_event: { total_contestants: @tournament_event.total_contestants, tournament_date: @tournament_event.tournament_date } }
    end

    assert_redirected_to tournament_event_url(TournamentEvent.last)
  end

  test "should show tournament_event" do
    get tournament_event_url(@tournament_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournament_event_url(@tournament_event)
    assert_response :success
  end

  test "should update tournament_event" do
    patch tournament_event_url(@tournament_event), params: { tournament_event: { total_contestants: @tournament_event.total_contestants, tournament_date: @tournament_event.tournament_date } }
    assert_redirected_to tournament_event_url(@tournament_event)
  end

  test "should destroy tournament_event" do
    assert_difference('TournamentEvent.count', -1) do
      delete tournament_event_url(@tournament_event)
    end

    assert_redirected_to tournament_events_url
  end
end

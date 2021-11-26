json.extract! tournament_event, :id, :total_contestants, :tournament_date, :created_at, :updated_at
json.url tournament_event_url(tournament_event, format: :json)

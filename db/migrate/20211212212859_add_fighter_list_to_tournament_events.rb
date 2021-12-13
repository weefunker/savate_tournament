class AddFighterListToTournamentEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :tournament_events, :fighter_list, :jsonb
  end
end

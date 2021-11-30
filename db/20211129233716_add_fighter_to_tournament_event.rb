class AddFighterToTournamentEvent < ActiveRecord::Migration[6.1]
    def change
      add_reference :tournament_events, :fighter, null: false, foreign_key: true
    end
  end



  


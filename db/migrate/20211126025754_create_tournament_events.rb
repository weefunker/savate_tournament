class CreateTournamentEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :tournament_events do |t|
      t.integer :total_contestants
      t.datetime :tournament_date

      t.timestamps
    end
  end
end

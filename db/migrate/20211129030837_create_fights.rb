class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.references :tournament_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end


id: 99, tournament_event_id: tournament_event.last, contestant_one: fighter_id.first, contestant_two: fighter_id.last, fighter_id: nil
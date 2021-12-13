class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.references :tournament_event, null: false, foreign_key: true

      t.integer "fighter_one_id"
      t.integer "fighter_two_id"

      t.timestamps
    end
  end
end


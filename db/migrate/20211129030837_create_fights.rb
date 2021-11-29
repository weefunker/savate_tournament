class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.references :tournament_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

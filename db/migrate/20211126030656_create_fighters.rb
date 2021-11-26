class CreateFighters < ActiveRecord::Migration[6.1]
  def change
    create_table :fighters do |t|
      t.string :fighter_name
      t.integer :fighter_age
      t.string :fighter_height
      t.integer :fighter_weight
      t.string :fighter_gender
      t.string :fighter_experience
      t.integer :fighter_skill
      t.integer :fighter_score

      t.timestamps
    end
  end
end

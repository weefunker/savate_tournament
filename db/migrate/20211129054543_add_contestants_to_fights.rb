class AddContestantsToFights < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :contestant_one, :string
    add_column :fights, :contestant_two, :string
  end
end

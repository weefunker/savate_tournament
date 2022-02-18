class AddClubToFighter < ActiveRecord::Migration[6.1]
  def change
    add_column :fighters, :club, :string
  end
end

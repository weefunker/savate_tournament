class Fight < ApplicationRecord

  belongs_to :tournament_event
  belongs_to :fighter_one, class_name: "Fighter", foreign_key: "fighter_one_id"
  belongs_to :fighter_two, class_name: "Fighter", foreign_key: "fighter_two_id"


end


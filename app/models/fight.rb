class Fight < ApplicationRecord

  has_many :tournament_event
  has_many :fights, :through => :tournament_events

end

class Contestant < ApplicationRecord
  belongs_to :fighter
  belongs_to :tournament_events
end

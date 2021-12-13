class Scrap < ApplicationRecord
  belongs_to :fighter
  belongs_to :tournament_events
end

class Fight < ApplicationRecord

  belongs_to :tournament_event
  has_many :figther
end

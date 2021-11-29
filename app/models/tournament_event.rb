class TournamentEvent < ApplicationRecord
    has_many :fighters
    has_many :fights, through: :fighters
end

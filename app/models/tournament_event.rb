class TournamentEvent < ApplicationRecord
    has_many :fights
    has_many :fighters, through: :fights

    store_accessor :fighter_list


    after_commit :gen_total_contestants

    def gen_total_contestants
        self.update_column(:total_contestants, self.fighter_list.length)
    end

end




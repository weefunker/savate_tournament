class TournamentEvent < ApplicationRecord
    has_many :fights
    has_many :fighters

    store_accessor :fighter_list


    after_commit :gen_total_contestants

    def gen_total_contestants
        self.update_column(:total_contestants, self.fighter_list.length)
    end

    # Prototype for expansion 
    def gen_fights
        @dundonald_list = []
        @bryansford_list = [] 
        @tournament_entrants = []

        self.fighter_list.each do |fighter| 
        x = Fighter.find(fighter) 
        @dundonald_list << x if x.club == "Dundonald" 
        @bryansford_list << x if x.club == "Bryansford"
        end

        sorted_dundonald = @dundonald_list.sort_by!(&:fighter_score)
        sorted_bryansford = @bryansford_list.sort_by!(&:fighter_score)
    end


    # find the fighter 
    # pair them with contestant from opposite club 
    # 

end




class TournamentEvent < ApplicationRecord
    has_many :fighters
    has_many :fights

    after_create :generate_fights 


    def generate_fights
    # load all of the figthers in the database for now 
 
        fight_list = Fighter.all.sort_by(&:fighter_score)
        fight_list.each do |x|
        Fight.create!(tournament_event_id: self.id, contestant_one: fight_list[0].id, contestant_two: fight_list[1].id)
        fight_list.pop(2)
        end
    

    end







end




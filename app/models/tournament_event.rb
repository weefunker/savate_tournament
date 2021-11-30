class TournamentEvent < ApplicationRecord
    has_many :fighters, optional: true
    has_many :fights

    after_create :generate_fights 


    def generate_fights
    # load all of the figthers in the database for now 
 
        
     

    end







end




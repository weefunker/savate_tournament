class Fighter < ApplicationRecord

    has_many :tournament_events
    after_save :generate_fighter_score
    
    def generate_fighter_score
        total_score = 0 

        # Age
        total_score += (fighter_age * 3)
        total_score += 10 if fighter_age >= 9
        total_score += 20 if fighter_age >= 12

        # Height 
        total_score += (fighter_height.to_i / 2) - 20


        # BMI 
        fighter_height_inches = (fighter_height.to_f * 0.3937)
        fighter_bmi = fighter_weight / (fighter_height_inches * fighter_height_inches) * 10000
        
        total_score += 8 if fighter_bmi >= 20 && fighter_bmi <= 26
        total_score += 5 if fighter_bmi >= 27 && fighter_bmi <= 32
        
        total_score -= 5 if fighter_bmi >= 18 
        total_score -= 5 if fighter_bmi >= 33


        # Weight 
        total_score += (fighter_weight - 20)

        # Gender 
        total_score = (total_score - 30 ) if fighter_gender == "Female" && fighter_age <= 17
        
        self.update_column(:fighter_score, total_score)


    end



    def old_generate_fighter_score 
          total_score = 0 
          # Age 
          total_score += (fighter_age * 2) if fighter_age < 16 
          total_score += 1 if fighter_age <= 7
          total_score += 2  if fighter_age >= 9
          total_score += 5  if fighter_age >= 9
    
          total_score += 10 if fighter_age >= 16 && fighter_age <= 40 
          total_score += 15 if fighter_age >= 25 && fighter_age <= 40 
          total_score += 10 if fighter_age >= 30 && fighter_age <= 40 
          total_score -= (5 + (fighter_age/5)) if fighter_age >= 42  
          total_score -= (18 + (fighter_age/5)) if fighter_age <= 18  
  
          # Height 
          total_score += fighter_height.to_i 
          total_score += 10 if fighter_height.to_i >=68
          total_score -= 15 if fighter_height.to_i <=67 && fighter_age >= 16
      
          # BMI 

          fighter_bmi = fighter_weight / (fighter_height_to_cm * fighter_height_to_cm) * 10000
          
          total_score += 15 if fighter_bmi >= 20 && fighter_bmi <= 26
          total_score += 10 if fighter_bmi >= 27 && fighter_bmi <= 32
          
          total_score -= 15 if fighter_bmi >= 18 
          total_score -= 15 if fighter_bmi >= 33
          
          # Weight 
          total_score += fighter_weight 
  
          # Fighter Experience -  "None", "A few fights", "Lots of Fights"
          total_score -= 15 if fighter_experience == "None"
          total_score += 20 if fighter_experience == "A few fights"
          total_score += 40 if fighter_experience == "Lots of Fights"
  
  
          # Fighter Skill - "Novice", "Intermediate", "Advanced"
          total_score -=15 if fighter_skill == "Novice"
          total_score +=20 if fighter_skill == "Intermediate"
          total_score +=35 if fighter_skill == "Advanced"
          total_score +=65 if fighter_skill == "Exceptional"
      
          # Gender 
          total_score = (total_score/4) if fighter_gender == "Female" && fighter_age > 18
          total_score = (total_score - 20 ) if fighter_gender == "Female" && fighter_age <= 17
          
          self.update_column(:fighter_score, total_score)
    end


    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Fighter.create!(row.to_hash)
        end
    end



end

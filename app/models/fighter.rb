class Fighter < ApplicationRecord

    belongs_to :tournament_event, optional: true

    after_commit :generate_fighter_score



    def generate_fighter_score 
          total_score = 0 
          # Age 
          total_score += 10 if fighter_age >= 16 && fighter_age <= 40 
          total_score += 15 if fighter_age >= 25 && fighter_age <= 40 
          total_score += 10 if fighter_age >= 30 && fighter_age <= 40 
          total_score -= (5 + (fighter_age/5)) if fighter_age >= 42  
          total_score -= (18 + (fighter_age/5)) if fighter_age <= 18  
  
          # Height 
          total_score += fighter_height.to_i 
          total_score += 10 if fighter_height.to_i >=68
          total_score -= 15 if fighter_height.to_i <=67
      
          # BMI 
          fighter_height_to_cm = (fighter_height.to_i + 1) * 2.54
          fighter_bmi = fighter_weight / (fighter_height_to_cm * fighter_height_to_cm) * 10000
          
          total_score += 15 if fighter_bmi >= 20 && fighter_bmi <= 26
          total_score += 10 if fighter_bmi >= 27 && fighter_bmi <= 32
          
          total_score -= 15 if fighter_bmi >= 18 
          total_score -= 15 if fighter_bmi >= 33
          
          # Weight 
          total_score += fighter_weight 
  
          # Fighter Experience -  "None", "A few fights", "Lots of Fights"
          total_score -= 10 if fighter_experience == "None"
          total_score += 20 if fighter_experience == "A few fights"
          total_score += 40 if fighter_experience == "Lots of Fights"
  
  
          # Fighter Skill - "Novice", "Intermediate", "Advanced"
          total_score -=10 if fighter_skill == "Novice"
          total_score +=20 if fighter_skill == "Intermediate"
          total_score +=40 if fighter_skill == "Advanced"
      
          # Gender 
          total_score = (total_score/4) if fighter_gender == "Female"
          
          self.update_column(:fighter_score, total_score)
    end


end

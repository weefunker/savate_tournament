# Tournament Generator 
Option for intergender tournaments?

# Schema 

User Admin only 


Fighters Scaffold
Tournament Scaffold
Bracket Model 


#### fighter > Can be added to tournament
fighter_age 
fighter_height
fighter_weight
fighter_gender 
fighter_experience 
fighter_skill
fighter_score

# Tournament Structure 
A tournament has the number of contestants / 4 for brackets
after_create calls a generates_brackets method

#### tournament > has_many fighters has_many brackets
total_contestants
tournament_date

# Brackets


#### bracket > has_many fighters
Bracket average fighter score should be evened out as a last metric in deciding fights 


# Userflow 

Add fighters to tournament by radio button on create tournament page 
Fighters are loaded into tournament via params 


# Bracket 1
Fighter  
Fighter 
Fighter 
Fighter 


# Bracket 2 | Skill_Level | Experience | Overall
Fighter  
Fighter 
Fighter 
Fighter 



#### tournament logic 
An overall score will be the primary metric for deciding who goes into each bracket 
Next height and weight descrepancies will be accounted for within the bracket if a fighter is 




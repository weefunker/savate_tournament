# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


arr_skills = ['Novice', 'Novice', 'Novice', 'Intermediate', 'Intermediate', 'Intermediate', 'Intermediate', 'Advanced', 'Advanced', 'Exceptional']
arr_exp = ['None', 'A few fights', 'A few fights', 'Lots of Fights']
arr_gender = ['Male', 'Female', 'Male']

arr_club = ['Bryansford', 'Dundonald']




16.times do 
    gender = arr_gender.sample
Fighter.create!(club: arr_club.sample, fighter_age: rand(5..13), fighter_height:  rand(100..150), fighter_weight:  rand(30..55), fighter_gender: gender, fighter_experience: arr_exp.sample, fighter_skill: arr_skills.sample, fighter_name: gender == 'Male' ? Faker::Name.male_first_name + " " + Faker::Name.last_name : Faker::Name.female_first_name + " " + Faker::Name.last_name  )

end


# Smallest Height 36 
# Largest Height 96

# Fighter Skill - 'Novice', 'Intermediate', 'Advanced'

 # Fighter Experience -  'None', 'A few fights', 'Lots of Fights'
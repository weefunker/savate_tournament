# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


arr_skills = ['Novice', 'Intermediate', 'Advanced']
arr_exp = ['None', 'A few fights', 'Lots of Fights']
arr_gender = ['Male', 'Female']


16.times do 
Fighter.create!(fighter_name: Faker::Name.name, fighter_age: rand(16..50), fighter_height:  rand(36..86), fighter_weight:  rand(53..117), fighter_gender: arr_gender.sample, fighter_experience: arr_exp.sample, fighter_skill: arr_skills.sample)
end


# Smallest Height 36 
# Largest Height 96

# Fighter Skill - 'Novice', 'Intermediate', 'Advanced'

 # Fighter Experience -  'None', 'A few fights', 'Lots of Fights'
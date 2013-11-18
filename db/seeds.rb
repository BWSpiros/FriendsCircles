# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

david = User.new(email: "parkdy6@gmail.com")
david.password = "password"
david.save!

brian = User.new(email: "brian@brian.com")
brian.password = "password"
brian.save!
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

batman = User.new(email: "brucewayne@wayneenterprises.com")
batman.password = "batman"
batman.save!

superman = User.new(email: "clarkkent@dailyplanet.com")
superman.password = "superman"
superman.save!

heroes = FriendCircle.new(owner_id: 4, name: "Justice League")
heroes.save!

FriendCircleMembership.create!(user_id: 3, friend_circle_id: 1)
FriendCircleMembership.create!(user_id: 4, friend_circle_id: 1)
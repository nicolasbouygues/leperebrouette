# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

# TODO: Write a seed to insert 100 posts in the database

puts 'Creating 10 fake users and a barrow'
10.times do
  user = User.new(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.save!
end
Barrow.create(user_id: 1, name: "Choupette", description: "A chenille, 1,6L, V6 Turbo Sport", category: "Thermique", price: 667)
puts 'Finished!'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Creating 10 fake restaurants...'
10.times do
  restaurant = Restaurant.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone_number: rand(0..5).to_s,
    category: "italian"
  )
  restaurant.save!
end
puts 'Finished!'

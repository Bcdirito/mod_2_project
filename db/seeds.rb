# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Musician.destroy_all
Genre.destroy_all
Review.destroy_all
User.destroy_all

Genre.create(name: "Pop")
Genre.create(name: "Rock")
Genre.create(name: "R&B")
Genre.create(name: "Rap")
Genre.create(name: "Hip Hop")
Genre.create(name: "Country")
Genre.create(name: "Alternative")
Genre.create(name: "EDM")
Genre.create(name: "Folk")
Genre.create(name: "Singer/Songwriter")
Genre.create(name: "Funk")
Genre.create(name: "Metal")
Genre.create(name: "Adult Contemporary")
Genre.create(name: "Other")

puts "Done!"

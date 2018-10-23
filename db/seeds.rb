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

User.create(first_name: "Brian", last_name: "DiRito", password: "password", password_digest: "password" )
User.create(first_name: "Bijon", last_name: "Miles", password: "password", password_digest: "password" )
User.create(first_name: "Rajvir", last_name: "Rai", password: "password", password_digest: "password" )
User.create(first_name: "Prince", last_name: "Wilson", password: "password", password_digest: "password" )
User.create(first_name: "Arren", last_name: "Alexander", password: "password", password_digest: "password" )

Musician.create(name: "Brian Detlefs", genre: "Singer/Songwriter", band_members: nil, bio: "Singer/Songwriter from Seattle. Loves Prince." image: nil rate: 0)
Musician.create(name: "Anthony Pagano", genre: "Singer/Songwriter", band_members: nil, bio: "Singer/Songwriter from Florida. Loves John Mayer" image: nil rate: 4)
Musician.create(name: "Kyle Motsinger", genre: ["Pop", "Alternative"], band_members: nil, bio: "Singer/Songwriter from Illinois. Loves Scissor Sisters." image: nil rate: 3.5)
Musician.create(name: "Catherine Greenfield", genre: "Folk", band_members: nil, bio: "Singer/Songwriter from Seattle. Loves Folk." image: nil rate: 2 )
Musician.create(name: "John Arthur Greene", genre: ["Pop", "Rock"] band_members: nil, bio: "Singer/Songwriter from Seattle. Loves Prince." image: nil rate: 5)

Review.create(user_id: 1, musician_id: 2, rating: 4, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: 2, musician_id: 1, rating: 5, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: 2, musician_id: 2, rating: 5, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: 5, musician_id: 4, rating: 2, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: 4, musician_id: 3, rating: 1, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")

puts "Done!"

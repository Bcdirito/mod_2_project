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

User.create(first_name: "Brian", last_name: "DiRito", user_name: "bdirito", password: "password", password_digest: "password", picture: nil )
User.create(first_name: "Bijon", last_name: "Miles", user_name: "bijonm", password: "password", password_digest: "password", picture: nil )
User.create(first_name: "Rajvir", last_name: "Rai", user_name: "rajr", password: "password", password_digest: "password", picture: nil )
User.create(first_name: "Prince", last_name: "Wilson", user_name: "princew", password: "password", password_digest: "password", picture: nil )
User.create(first_name: "Arren", last_name: "Alexander", user_name: "arrena", password: "password", password_digest: "password", picture: nil )

Musician.create(name: "Brian Detlefs", genre: "Singer/Songwriter", band_members: nil, bio: "Singer/Songwriter from Seattle. Loves Prince.", image: nil, rate: 0.0)
Musician.create(name: "Anthony Pagano", genre: "Singer/Songwriter", band_members: nil, bio: "Singer/Songwriter from Florida. Loves John Mayer", image: nil, rate: 4.3)
Musician.create(name: "That Band", genre: ["Pop", "Alternative"], band_members: ["Some Guy 1", "Some Guy 2", "Some Girl 1", "Some Girl 2"], bio: "Singer/Songwriter from Illinois. Loves Scissor Sisters.", image: nil, rate: 3.5)
Musician.create(name: "Catherine Greenfield", genre: "Folk", band_members: nil, bio: "Singer/Songwriter from Seattle. Loves Folk.", image: nil, rate: 2.7 )
Musician.create(name: "John Arthur Greene", genre: ["Pop", "Rock"], band_members: nil, bio: "Singer/Songwriter from Seattle. Loves Prince.", image: nil, rate: 5.0)

Review.create(user_id: User.first.id, musician_id: Musician.second.id, rating: 4, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: User.second.id, musician_id: Musician.first.id, rating: 5, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: User.first.id, musician_id: Musician.second.id, rating: 5, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: User.last.id, musician_id: Musician.last.id, rating: 2, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")
Review.create(user_id: User.third.id, musician_id: Musician.third.id, rating: 1, content: "KILLLLLLLLLLEEEEEEEEDDDDDDD ITTTTTTTTT")

puts "Done!"

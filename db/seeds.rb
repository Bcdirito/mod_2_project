Musician.destroy_all
Genre.destroy_all
Review.destroy_all
Listener.destroy_all


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

Listener.create(first_name: "Brian", last_name: "DiRito", user_name: "bdirito", password_digest: BCrypt::Password.create("password"), picture: nil )
Listener.create(first_name: "Bijon", last_name: "Miles", user_name: "bijonm", password_digest: BCrypt::Password.create("password"), picture: nil )
Listener.create(first_name: "Rajvir", last_name: "Rai", user_name: "rajr", password_digest: BCrypt::Password.create("password"), picture: nil )
Listener.create(first_name: "Prince", last_name: "Wilson", user_name: "princew", password_digest: BCrypt::Password.create("password"), picture: nil )
Listener.create(first_name: "Arren", last_name: "Alexander", user_name: "arrena", password_digest: BCrypt::Password.create("password"), picture: nil )

puts "Done!"

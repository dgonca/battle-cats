# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
	{email: "domstar1595@yahoo.com", password: "potato"},
	{email: "mdh.bing@gmail.com", password: "potato"},
	{email: "osbornegabriel@gmail.com", password: "password"},
	{email: "qymanab@gmail.com", password: "password"},
	{email: "kai@gmail.com", password: "password"}
	])

dom = User.find_by(email: "domstar1595@yahoo.com")
mark = User.find_by(email: "mdh.bing@gmail.com")
gabe = User.find_by(email: "osbornegabriel@gmail.com")
q = User.find_by(email: "qymanab@gmail.com")
kai = User.find_by(email: "kai@gmail.com")

pets = Pet.create([
	{name: "Oz", bio: "sweetest cuddle cat who loves to play fetch and bats you awake when its time to feed him.", animal_type: "cat", owner: dom, zipcode: 60647, },
	{name: "Basil", bio: "slitherly snek that loves giving hand hugs.", animal_type: "snake", owner: dom, zipcode: 60647},
	{name: "Lambchop", bio: "lightfooted statuesque angel who always catches her prey.", owner: mark, animal_type: "cat", zipcode: 60625},
	{name: "Luna", bio: "a big girl with a petite frame with a beautiful frosty face (and a very short temper)", animal_type: "cat", owner: mark, zipcode: 60625},
	{name: "Sir Fluffy Claws", bio: "Fluffy enjoys eating mice and winter hibernation. You'd think Chicago would be the right place for him, but there aren't that many local caves.", zipcode: 60608, owner: gabe, animal_type: "owlbear"},
	{name: "Humphrey", animal_type: "dog", bio: "It's Humph! He like fries and making grumble noises when you pet him!", owner: q, zipcode: 60601},
	{name: "Spooky", animal_type: "rabbit", bio: "a speed racer who likes to flip over beer cans and cuddle upside down with you.", owner: kai, zipcode: 60647}
	])	







	

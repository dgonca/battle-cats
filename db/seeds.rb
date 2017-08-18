# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
	{email: "domstar1595@yahoo.com", password: "password"},
	{email: "mdh.bing@gmail.com", password: "password"},
	{email: "ehuggi@saic.edu", password: "password"},
	{email: "osbornegabriel@gmail.com", password: "password"},
	{email: "qymanab@gmail.com", password: "password"}
	])	

dom = User.find_by(email: "domstar1595@yahoo.com")
mark = User.find_by(email: "mdh.bing@gmail.com")
kai = User.find_by(email: "ehuggi@saic.edu")
gabe = User.find_by(email: "osbornegabriel@gmail.com")
qymana = User.find_by(email: "qymanab@gmail.com")

pets = Pet.create([
	{name: "Oz", animal_type: "cat", zipcode: 60647, owner: dom, bio: "the sweetest cuddle cat who loves to play fetch and bat you awake to feed him."},
	{name: "Basil", animal_type: "snake", zipcode: 60647, owner: dom, bio: "a slitherly snek who loves to give hand hugs with his body"},
	{name: "Lambchop", animal_type: "cat", zipcode: 60625, owner: mark, bio: "lightfooted statuesque angel who always catches her prey."},
	{name: "Luna", animal_type: "cat", zipcode: 60625, owner: mark, bio: "a beautiful girl with a petite frame and a frosty face."},
	{name: "Spooky", animal_type: "rabbit", zipcode: 60647, owner: kai, bio: "speed racer who loves to nibble on everything and be cuddled while upside down in your arms"},
	{name: "Sir Fluffly Claws", animal_type: "owlbear", zipcode: 60608, owner: gabe, bio: "Fluffy enjoys eating mice and winter hibernation. You'd think Chicago would be the right place for him, but there aren't that many local caves."},
	{name: "Humphrey", animal_type: "dog", zipcode: 60601, owner: qymana, bio: "It's Humph! He like fries and making grumble noises when you pet him!"}
	])
	

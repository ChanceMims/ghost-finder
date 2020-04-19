# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  lat = 30.026480
#  lng = -98.14058

post = Post.create(title: "Haunted Train Tracks",
    content: "My car broke down on top of train tracks,
    but right before a train hit me my car was pushed off of the rails!",
    user_id: 1, lat: 30.028699, lng: -98.146410)
post.image.attach(io: File.open('/Users/chance/Development/code/Mod3/Org-Ping-Pong/Ping-Pong-App/public/images/haunted-tracks.jpg'), filename: 'haunted-tracks.jpg')


post = Post.create(title: 'Goatman!!!', 
    content: 'I was camping with me friends over the weekend 
    and at midnight we saw a man shaped like a goat! It was Goatman!',
    user_id: 2, lat: 30.027688, lng: -98.137071)
post.image.attach(io: File.open('/Users/chance/Development/code/Mod3/Org-Ping-Pong/Ping-Pong-App/public/images/Goatman.jpg'), filename: 'Goatman.jpg')



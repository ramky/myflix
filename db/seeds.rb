# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedy      = Category.create(name: "Comedy")
drama       = Category.create(name: "Drama")

video1  = Video.create(title: 'Family Guy', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/family_guy.jpg", large_cover_image: "/assets/family_guy_large.jpg", categories: [comedy])
video2  = Video.create(title: 'Futurama', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/futurama.jpg", large_cover_image: "/assets/futurama_large.jpg", categories: [comedy])
video3  = Video.create(title: 'Good Will Hunting', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/good_will_hunting.jpg", large_cover_image: "/assets/good_will_hunting_large.jpg", categories: [drama])
video4  = Video.create(title: 'Men In Black', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/mib.jpg", large_cover_image: "/assets/mib_large.jpg", categories: [comedy])
video5  = Video.create(title: 'Monk', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/monk.jpg", large_cover_image: "/assets/monk_large.jpg", categories: [comedy])
video6  = Video.create(title: 'South Park', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/south_park.jpg", large_cover_image: "/assets/south_park_large.jpg", categories: [comedy])
video7  = Video.create(title: 'American President', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/the_american_president.jpg", large_cover_image: "/assets/the_american_president_large.jpg", categories: [drama])
video8  = Video.create(title: 'The Lion King', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/the_lion_king.jpg", large_cover_image: "/assets/the_lion_king_large.jpg", categories: [comedy])
video9  = Video.create(title: 'The Party', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/the_party.jpg", large_cover_image: "/assets/the_party_large.jpg", categories: [comedy])
video10 = Video.create(title: 'The Proposal', description: Faker::Lorem.paragraph(3), small_cover_image: "/assets/the_proposal.jpg", large_cover_image: "/assets/the_proposal_large.jpg", categories: [comedy])


test = User.create(full_name: Faker::Name.name, password: "password", email: Faker::Internet.email)
ram  = User.create(full_name: 'Ram Iyer', password: "password", email: 'ramky.iyer@yahoo.com')

Review.create(user: test, video: video7, rating: 5, description: "This is a very good show")
Review.create(user: test, video: video7, rating: 2, description: "I didn't like it")
Review.create(user: test, video: video7, rating: 3, description: "So so")

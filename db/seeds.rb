# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


video1 = Video.create(title: 'Family Guy', description: "Family guy description here", small_cover_image: "/tmp/family_guy.jpg", large_cover_image: "/tmp/family_guy.jpg")
video2 = Video.create(title: 'Futurama', description: "Futurama description here", small_cover_image: "/tmp/futurama.jpg", large_cover_image: "/tmp/futurama.jpg")
video3 = Video.create(title: 'South Park', description: "South Park description here", small_cover_image: "/tmp/south_park.jpg", large_cover_image: "/tmp/south_park.jpg")
video4 = Video.create(title: 'Monk', description: "Monk description here", small_cover_image: "/tmp/monk.jpg", large_cover_image: "/tmp/monk_large.jpg")
video5 = Video.create(title: 'Monk', description: "Monk description here", small_cover_image: "/tmp/monk.jpg", large_cover_image: "/tmp/monk_large.jpg")
video6 = Video.create(title: 'Family Guy', description: "Family guy description here", small_cover_image: "/tmp/family_guy.jpg", large_cover_image: "/tmp/family_guy.jpg")
video7 = Video.create(title: 'Futurama', description: "Futurama description here", small_cover_image: "/tmp/futurama.jpg", large_cover_image: "/tmp/futurama.jpg")
video8 = Video.create(title: 'South Park', description: "South Park description here", small_cover_image: "/tmp/south_park.jpg", large_cover_image: "/tmp/south_park.jpg")
video9 = Video.create(title: 'Monk', description: "Monk description here", small_cover_image: "/tmp/monk.jpg", large_cover_image: "/tmp/monk_large.jpg")
video10 = Video.create(title: 'Monk', description: "Monk description here", small_cover_image: "/tmp/monk.jpg", large_cover_image: "/tmp/monk_large.jpg")
video11 = Video.create(title: 'Family Guy', description: "Family guy description here", small_cover_image: "/tmp/family_guy.jpg", large_cover_image: "/tmp/family_guy.jpg")
video12 = Video.create(title: 'Futurama', description: "Futurama description here", small_cover_image: "/tmp/futurama.jpg", large_cover_image: "/tmp/futurama.jpg")
video13 = Video.create(title: 'South Park', description: "South Park description here", small_cover_image: "/tmp/south_park.jpg", large_cover_image: "/tmp/south_park.jpg")
video14 = Video.create(title: 'Monk', description: "Monk description here", small_cover_image: "/tmp/monk.jpg", large_cover_image: "/tmp/monk_large.jpg")
video15 = Video.create(title: 'Monk', description: "Monk description here", small_cover_image: "/tmp/monk.jpg", large_cover_image: "/tmp/monk_large.jpg")


action = Category.create(name: "Action")
documentary = Category.create(name: "documentary")

video1.categories << action
video2.categories << action
video3.categories << action
video4.categories << documentary
video5.categories << documentary
video6.categories << action
video7.categories << action
video8.categories << action
video9.categories << documentary
video10.categories << documentary
video11.categories << action
video12.categories << action
video13.categories << action
video14.categories << documentary
video15.categories << documentary

test = User.create(full_name: "Test User", password: "password", email: "test@example.com")

Review.create(user: test, video: video1, rating: 5, description: "This is a very good show")
Review.create(user: test, video: video1, rating: 2, description: "I didn't like it")
Review.create(user: test, video: video1, rating: 3, description: "So so")

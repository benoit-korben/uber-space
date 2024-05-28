require "open-uri"

puts "cleaning database"
Booking.destroy_all
Spaceship.destroy_all
User.destroy_all

puts "creating users"
10.times do
  User.new(name: Faker::Name.first_name, email: Faker::Internet.email, password: "azerty12345").save
end

10.times do
  file = URI.open("https://picsum.photos/300/200")
  spaceship = Spaceship.new(name: Faker::Name.first_name,
  description: Faker::Lorem.paragraph_by_chars(number: 10),
  number_of_places: rand(0..100),
  price_per_day: rand(50..5000),
  fuel: ["Uranium", "Plutonium", "tritium"].sample,
  is_available: [true, false].sample,
  user_id: User.all.sample.id,
  )
  spaceship.photo.attach(io: file, filename: "spaceship.jpg", content_type: "image/jpg")
  spaceship.save
end

10.times do Booking.new(
  start_date: Faker::Date.between(from: 505.days.ago, to: Date.today),
  end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
  status: [false, true].sample,
  spaceship_id: Spaceship.all.sample.id,
  user_id: User.all.sample.id
).save
end

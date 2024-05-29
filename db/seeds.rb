require "open-uri"

puts "cleaning database"
Booking.destroy_all
Spaceship.destroy_all
User.destroy_all

puts "creating users"
10.times do
  User.new(name: Faker::Name.first_name, email: Faker::Internet.email, password: "azerty12345").save
end

photo = ["https://images.unsplash.com/photo-1601892782633-675465fa7f3a",
"https://images.unsplash.com/flagged/photo-1595524288414-a7fda0a12d0c",
"https://images.unsplash.com/photo-1628126235206-5260b9ea6441",
"https://images.unsplash.com/photo-1614728263952-84ea256f9679",
"https://images.unsplash.com/photo-1543083115-638c32cd3d58",
"https://plus.unsplash.com/premium_photo-1683121271048-88e13aa31c11",
"https://plus.unsplash.com/premium_photo-1683133458753-5e543f5fff2e",
"https://images.unsplash.com/photo-1610483155766-e50e9774ad7f",
"https://plus.unsplash.com/premium_photo-1676795624719-b017d3be73a8",
"https://plus.unsplash.com/premium_photo-1676795460328-e02ee1b42b4c"
]
10.times.each_with_index do |_, index|
  file = URI.open("#{photo[index]}")
  spaceship = Spaceship.new(name: Faker::Name.first_name,
  description: Faker::Lorem.paragraph_by_chars(number: 10),
  number_of_places: rand(0..100),
  price_per_day: rand(50..5000),
  fuel: ["Uranium", "Plutonium", "tritium"].sample,
  is_available: [true, false].sample,
  user_id: User.all.sample.id,
  )
  spaceship.photo.attach(io: file, filename: "spaceship.jpeg", content_type: "image/jpeg")
  spaceship.save
end

150.times do Booking.new(
  start_date: Faker::Date.between(from: 505.days.ago, to: Date.today),
  end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
  status: rand(0..4),
  spaceship_id: Spaceship.all.sample.id,
  user_id: User.all.sample.id
).save
end

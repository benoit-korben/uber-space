require "open-uri"
require "faker"

puts "cleaning database"
Booking.destroy_all
Spaceship.destroy_all
User.destroy_all


description = [
  "Experience micro-gravity living at its finest! This cozy escape pod is perfect for the solo traveler. Amenities include a zero-G hammock, a dehydrated food dispenser with a surprising variety of flavors, and porthole views that will make you feel like you're floating in a cosmic watercolor painting. Warning: May experience mild cabin fever after the third asteroid belt crossing.",
  "Buckle up for a wild ride! This converted cargo hauler is perfect for families (or groups of friends who never quite grew up). Features include a laser tag arena that doubles as the living room, a bouncy castle ball pit under the cockpit, and an escape pod playhouse for the little astronauts. Please note: We are not responsible for lost socks in the airlock.",
  "Looking for an out-of-this-world getaway for two? This luxurious shuttle comes with a private viewing deck perfect for stargazing, a gravity-defying hot tub, and a fully stocked bar that specializes in alien cocktails. The onboard AI butler can even serenade you with love songs from across the galaxy. Warning: May cause uncontrollable giggling fits due to champagne bubbles in zero-G.",
  "Get back to basics with this charmingly refurbished mining vessel.  Perfect for the adventurous spirit, this rugged spaceship comes equipped with a rock climbing wall on the exterior hull, a telescope for asteroid spotting, and a cozy sleeping nook nestled within a hollowed-out crater. Caution: May encounter friendly space barnacles on the hull.",
  "Get ready to dance among the stars! This state-of-the-art spaceship boasts a pulsating dance floor, a bar that serves up glowing cocktails, and a DJ booth that's always spinning the hottest intergalactic beats. The onboard AI can even create custom playlists based on your mood. Warning: May experience spontaneous karaoke breakouts.",
  "Unplug and unwind in this charming wooden cabin... in space! This unique spaceship features a crackling fireplace hologram, comfy plaid blankets, and a fully stocked library of classic science fiction novels. Curl up with a cup of hot cocoa and watch the stars drift by your window. Note: Bears not included (but we do have a cuddly alien pet you can borrow).",
  "Blast off to the past in this vintage spaceship straight out of a pulp sci-fi novel.  This retro rocket comes complete with a chrome-plated cockpit, fins that shimmer in the sunlight, and a classic onboard jukebox that plays all your favorite space-age tunes. Warning: May experience nostalgia overload.",
  "Dive into a world of aquatic adventure on this submarine spaceship! Explore the depths of alien oceans, discover bioluminescent coral reefs, and get up close and personal with exotic underwater creatures. The onboard aquarium is home to a variety of fascinating alien fish. Note: May experience mild seasickness (or space sickness?) in rough stellar seas.",
  "Indulge in the ultimate space travel experience on this opulent star cruiser.  This floating palace boasts multiple restaurants, a zero-G swimming pool, a spa that offers intergalactic massages, and a theater that shows the latest holographic blockbusters. Please note: Formal attire is required for dinner (but space suits are optional).",
  "Embrace minimalist living in this compact spaceship designed for efficiency and sustainability. This tiny home comes with all the essentials, including a composting toilet, a solar-powered shower, and a hydroponic garden where you can grow your own space veggies. Warning: May experience mild claustrophobia after extended stays (but the views are totally worth it)."
]

email = [ "killian@botsford.test","benoit@botsford.test","ismael@botsford.test","matt@botsford.test","matt@botsford.test","matt@botsford.test","matt@botsford.test","matt@botsford.test","matt@botsford.test","matt@botsford.test"
]

booking_messages = [
  "Need ship. Four tentacles.",
  "Booking for Zorgon family.",
  "Urgent space travel required.",
  "Small vessel for solo trip.",
  "Seeking luxury cruiser.",
  "Family of six. Ship ASAP.",
  "Honeymoon suite in space?",
  "Business trip to Andromeda.",
  "Quickest route to Earth.",
  "Cargo hold for specimens.",
  "Seeking pet-friendly ship.",
  "Looking for a bargain.",
  "Group rate for pilgrims.",
  "Need ship with translator.",
  "Best ship for stargazing?",
  "Seeking escape pod rental.",
  "Is insurance included?",
  "Expedition to Nebula-9.",
  "Two-week rental needed.",
  "Do you offer discounts?",
  "Can't wait to explore!",
  "Adventure awaits! Ship me!",
  "Spaceship, here I come!",
  "Time to vacation in space!",
  "So excited for my trip!",
  "Let's blast off together!",
  "Ready for a cosmic joyride!",
  "Zero-G dance party, anyone?",
  "Gotta see those nebulae!",
  "Packing my space snacks now.",
  "I'm bringing my space pets!",
  "This will be out of this world!",
  "Honeymoon on a spaceship? Yes!",
  "Ready to meet some aliens!",
  "I hope there's a space bar.",
  "The cosmos calls to me!",
  "Adventure is my middle name!",
  "Gotta love that zero-G feeling!",
  "Can't wait to float around!",
  "This is going to be epic!",
  "Requesting booking information.",
  "Please confirm availability.",
  "Seeking suitable vessel for travel.",
  "Would like to reserve a spaceship.",
  "Kindly provide rental options.",
  "Interested in your services.",
  "Can you accommodate my needs?",
  "Please send me a quote.",
  "Hoping to book soon.",
  "Your assistance is appreciated.",
  "I am eager to hear from you.",
  "Looking forward to your reply.",
  "Thank you for your time.",
  "Your prompt response is requested.",
  "I await your confirmation.",
  "Please provide further details.",
  "I would like to discuss options.",
  "Could you please clarify?",
  "Please advise on the next steps.",
  "Thank you in advance.",
  "Beam me up, Scotty! (Just kidding)",
  "Do you offer frequent flyer miles?",
  "Spaceship with a hot tub, please!",
  "Can I bring my pet rock?",
  "Is there Wi-Fi in space?",
  "Hoping to avoid space pirates.",
  "Do you have a lost and found?",
  "Can I test drive the spaceship?",
  "I promise not to abduct anyone.",
  "Do you have a space-themed bar?",
  "I'll bring the moon cheese!",
  "Will my hair look good in zero-G?",
  "Any chance of a celebrity sighting?",
  "Hoping for a close encounter.",
  "Can I get a window seat?",
  "Don't worry, I have travel insurance.",
  "Is there a dress code in space?",
  "I'll tip the spaceship attendant.",
  "Looking for a smooth ride, please.",
  "Any chance of seeing a black hole?",
  "Need ship immediately.",
  "Time is of the essence.",
  "Urgent evacuation needed.",
  "This is a matter of life or death.",
  "Highest priority request.",
  "Must leave planet by tomorrow.",
  "Situation critical. Need transport.",
  "Don't let me down.",
  "I'm counting on you.",
  "This is an emergency.",
  "No time to waste.",
  "My life depends on this.",
  "Please act quickly.",
  "This is my last resort.",
  "Hurry, please.",
  "Do not delay.",
  "I'm desperate.",
  "Help me!",
  "Please respond ASAP.",
  "Time is running out.",
  "The stars align.  Passage sought.",
  "Seek vessel for celestial journey.",
  "Destiny calls beyond the stars.",
  "Ancient prophecy guides my path.",
  "The universe beckons.",
  "My quest begins amongst the stars.",
  "I am but a traveler in time.",
  "The cosmos holds the answers.",
  "I seek a vessel for my destiny.",
  "The stars whisper my name.",
  "Need ship with cloaking device.",
  "Looking for a ship with a spa.",
  "Must have hyperspace capabilities.",
  "Require ship with weapons systems.",
  "Seeking ship with holographic deck.",
  "Need ship with teleportation device.",
  "Must have a self-destruct mechanism.",
  "Looking for a ship with a library.",
  "Require a ship with a medical bay.",
  "Seeking ship with a hydroponic garden."
]

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
  User.new(name: Faker::Name.first_name, email: email[index], password: "azerty").save
end

10.times.each_with_index do |_, index|
  file = URI.open("#{photo[index]}")
  spaceship = Spaceship.new(
    name: Faker::Books::Dune.planet,
    description: description[index],
    number_of_places: rand(0..100),
    price_per_day: rand(50..5000),
    fuel: ["Uranium", "Plutonium", "Tritium", "Deuterium", "Antimatter"].sample,
    is_available: [true, false].sample,
    user_id: User.all.sample.id,
  )
  spaceship.main_image.attach(io: file, filename: "spaceship.jpeg", content_type: "image/jpeg")
  4.times do |i|
    file = URI.open("#{photo.sample}")
    spaceship.secondary_images.attach(io: file, filename: "spaceship-#{i}.jpeg", content_type: "image/jpeg")
  end
  spaceship.save
end

150.times.each_with_index do |_, index|
  Booking.new(
  start_date: Faker::Date.between(from: 505.days.ago, to: Date.today),
  end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
  status: rand(0..4),
  spaceship_id: Spaceship.all.sample.id,
  user_id: User.all.sample.id,
  message: booking_messages[index]
).save
end

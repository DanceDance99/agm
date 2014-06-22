shuttle = Shuttle.create(name: 'Shuttle', sunday: true, friday: true, start_date: Date.today)
shuttle.amount = 3900
shuttle.round_trip_amount = 6900
shuttle.group_amount = 35000
shuttle.group_round_trip_amount = 60000
shuttle.save

shuttle.shuttle_cities.create(name: 'Las Vegas')
shuttle.shuttle_cities.create(name: 'Glendale')
shuttle.shuttle_cities.create(name: 'Hollywood')

las_vegas = Tour.create(
           name: 'Las Vegas City Tour',
           amount: 5499,
           time: '10:00am',
           location: 'Free pick-up',
           duration: '4 hours (approx.)',
           description: 'Las Vegas Guided Day Tour will truly introduce you to the whole of Las Vegas, from its heyday of classic casinos, legendary performers like Frank Sinatra and the Mafia to the new mega-resorts that characterize modern Las Vegas. The tour includes numerous stops on the Strip and downtown.',
           highlights: 'See the iconic sights of classic Las Vegas on the Las Vegas Guided Day Tour, Learn the inside stories of performing greats like Frank Sinatra and Elvis, Hear the story of how the Mafia built Las Vegas, See Las Vegas jaw-dropping mega-attractions, Find out the tips and tricks that will make you a Vegas insider, Knowledgeable and enthusiastic guides provide onboard commentary and accompany you at each stop, Exclusive VIP Tour with Mercedes Sprinter and limited seating (5-11 passengers)',
           start_date: Date.today,
           monday: true, tuesday: true, wednesday: true, thursday: true, saturday: true
          )

grand_canyon = Tour.create(
           name: 'Grand Canyon Tour',
           amount: 12999,
           time: '7:00am',
           location: 'Free pick-up',
           duration: '14 hours (approx.)',
           description: 'Nearly 40 million visitors come to Las Vegas each year, but only a few of you will experience the fun and excitement of viewing the Grand Canyon! Your tour will leave from Las Vegas with views of Boulder City, Lake Mead, and over the Mighty Hoover Dam on the new Mike O’Callaghan – Pat Tillman Bypass Bridge which is the longest concrete arch in the Western hemisphere spanning over 1,000 feet and 890 feet above the Colorado River. ',
           highlights: 'Boxed lunch, After arriving at the Visitor’s Center at the Grand Canyon you will have the option to hike the 2.5 mile paved trail that allows you to walk from Mather point to Grand Canyon Village and enjoy the breathtaking panoramic views of the canyon / Colorado River and the Phantom Ranch, Walk along the railed lookout and view the majestic beauty of one of the Seven Natural Wonders of the World.  Your Grand Canyon tour concludes with a comfortable drive back to Las Vegas so you can enjoy your night in Sin City. Don’t forget your camera as you will be experiencing one of the greatest shows on earth, Exclusive VIP Tour with Mercedes Sprinter and limited seating (5-11 passengers) ',
           start_date: Date.today,
           monday: true, tuesday: true, wednesday: true, thursday: true, saturday: true
          )


hoover_dam = Tour.create(
           name: 'Hoover Dam Tour',
           amount: 7999,
           time: '8:00am',
           location: 'Free pick-up',
           duration: '5 hours (approx.)',
           description: 'Hoover Dam is the NUMBER ONE SIGHTSEEING ATTRACTION with people visiting Las Vegas. This modern wonder of the world has been called the “Greatest Dam ever Built”. It is a National Historic Landmark, and stands today as a testament to the thousands of men and women and their families who came to a harsh and barren land and in less than five years built a world renowned structure which changed the future of the west.',
           highlights: "Once you arrive at the dam you will have a minimum of two hours to take the Official Government Interior Tour / new Hoover Dam Discovery Museum Tour / Visitors Center and gaze over the overlook all included at no additional cost, View the spectacular Mike O'Callaghan – Pat Tillman Memorial Bridge (Hoover Dam bypass bridge) which is the Western hemisphere's 2nd highest bridge towering 890 feet above the Mighty Colorado River and Hoover Dam, Spend your time walking across the Dam from the Nevada side to the Arizona side exploring many works of art along the way. The photo opportunities are endless, Exclusive VIP Tour with Mercedes Sprinter and limited seating (5-11 passengers)",
           start_date: Date.today,
           monday: true, tuesday: true, wednesday: true, thursday: true, saturday: true
          )

red_rock = Tour.create(
           name: 'Red Rock Canyon Tour',
           amount: 6999,
           time: '8:00am',
           location: 'Free pick-up',
           duration: '4 hours (approx.)',
           description: "While you're in Las Vegas, take a visit to Red Rock Canyon, one of the Mojave Desert's most beautiful attractions.  Red Rock is one of Nevada’s most popular areas for great photographic and sightseeing experiences.  Red Rock Canyon is also part of the Keystone Fault. The colorful rock formations were formed over 65 MILLION years ago after the earth’s plates collided You will hear more about past explorers and the canyon's unique geography and wildlife.",
           highlights: "Guided sightseeing tour of the Red Rock Canyon from Las Vegas, Leisurely 13-mile (21-kilometer) scenic loop, Calico Hills, Roasting pits and petroglyphs at Willow Springs",
           start_date: Date.today,
           monday: true, tuesday: true, wednesday: true, thursday: true, saturday: true
          )

valley_of_fire = Tour.create(
           name: 'Valley of Fire Tour',
           amount: 11499,
           time: '9:00am',
           location: 'Free pick-up',
           duration: '6 hours (approx.)',
           description: "Journey back 3000 years in time and discover the Great Anasasi “Lost City.”  Experience authentic Pueblos, pottery, baskets, arrowheads, tools, mystical ancient Indian Petroglyphs and other priceless artifacts.  This tour of early Native American life is truly the Jewel of the American Southwest.  The incredible Valley of Fire was once the spiritual center of this great Early American Civilization.  The rock formations and Indian art will amaze you. You will be moved to your soul on this spiritual and wonder filled adventure.",
           highlights: "Come and explore one of Nevada's most visually stunning sites! The surroundings are loaded with vibrant color / fantastic rock formations and world-class petroglyphs, You'll see nature's work-of-art at Rainbow Vista / Atlatl Rock and Fire Canyon with petrified sand dunes sculpted into amazing shapes and contours only wind / water and time could create, Exclusive VIP Tour with Mercedes Sprinter and limited seating (5-11 passengers)",
           start_date: Date.today,
           monday: true, tuesday: true, wednesday: true, thursday: true, saturday: true
          )

death_valley = Tour.create(
           name: 'Death Valley Tour',
           amount: 17999,
           time: '7:00am',
           location: 'Free pick-up',
           duration: '11 hours (approx.)',
           description: "Escape to the desert on a day trip to Death Valley during your Las Vegas vacation. You'll travel through the magnificent Mojave Desert and visit the Spanish-style Scotty's Castle.  Tour Ubehebe Crater and visit the atmospheric Furnace Creek Ranch Museum and Rhyolite Ghost Town.",
           highlights: "Boxed lunch, Death Valley tours from Las Vegas stops at Ubehebe Crater / Furnace Creek Ranch Museum / Badwater and Rhyolite Ghost Town, Get away from the glitz for an adventure at stark and fascinating Death Valley National Park on this all-inclusive day trip. It's pretty amazing walking around Badwater Basin the lowest point in North America, Exclusive VIP Tour with Mercedes Sprinter and limited seating (5-11 passengers)",
           start_date: Date.today,
           monday: true, tuesday: true, wednesday: true, thursday: true, saturday: true
          )




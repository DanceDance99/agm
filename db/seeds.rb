User.create(username: 'Armen', password: 'bulgaria')

shuttle = Shuttle.create(name: 'Shuttle', sunday: true, friday: true, start_date: Date.today)
shuttle.amount = 3900
shuttle.round_trip_amount = 6900
shuttle.group_amount = 35000
shuttle.group_round_trip_amount = 60000
shuttle.save

shuttle.shuttle_cities.create(name: 'Las Vegas')
shuttle.shuttle_cities.create(name: 'Glendale')
shuttle.shuttle_cities.create(name: 'Hollywood')

shuttle.save #need save to compute legs after cities


las_vegas = Tour.create(
           name: 'Las Vegas City Tour',
           amount: 5499,
           time: '6:00pm',
           location: 'Free pick-up and drop-off from your hotel',
           duration: '4 hours',
           description: 'Las Vegas Guided Day Tour will truly introduce you to the whole of Las Vegas, from its heyday of classic casinos, legendary performers like Frank Sinatra and the Mafia to the new mega-resorts that characterize modern Las Vegas.',
           highlights: 'See the iconic sights of classic Las Vegas on the Las Vegas Guided Day Tour, Learn the inside stories of performing greats like Frank Sinatra and Elvis, Hear the story of how the Mafia built Las Vegas, See Las Vegas jaw-dropping mega-attractions, Find out the tips and tricks that will make you a Vegas insider, Knowledgeable and enthusiastic guides provide onboard commentary and accompany you at each stop ',
           start_date: Date.today,
           saturday: true, sunday: true
          )

grand_canyon = Tour.create(
           name: 'Grand Canyon Tour',
           amount: 12999,
           time: '7:00pm',
           location: 'Free pick-up and drop-off from your hotel',
           duration: '4 hours',
           description: 'Nearly 40 million visitors come to Las Vegas each year, but only a few of you will experience the fun and excitement of viewing the Grand Canyon, Las Vegas, Lake Mead, Hoover Dam and the beautiful desert landscape surroundings on board a private aircraft. Whether you want to impress a date, party with your friends or enjoy a family sightseeing excursion',
           highlights: 'View rugged desert wilderness, You will be taken into the National Park to the South Rim’s scenic overlooks and many other attractions in the Historic Village District, Spectacular South Rim tour inside the Canyon’s National Park, Multiple views include Bright Angel Point and Mather Point overlooks, Many photo opportunities of a lifetime & time for souvenir shopping',
           start_date: Date.today,
           saturday: true, sunday: true
          )


hoover_dam = Tour.create(
           name: 'Hoover Dam Tour',
           amount: 7999,
           location: 'Free pick-up and drop-off from your hotel',
           duration: '3 hours',
           description: 'This is the "Best of the Best" Hoover Dam Tour! Your professional tour guides will educate and entertain you on all aspects of Hoover Dam in an informative and interesting way, allowing you to enjoy every moment of your visit.',
           highlights: 'Knowledgeable guides provide a sightseeing tour with a difference, Government Discovery Tour down into the walls of the Black Canyon, Walk on the spectacular Hoover Dam Bypass Bridge for an incredible view and one of a kind photo adventure!',
           start_date: Date.today,
           monday: true, tuesday: true
          )

red_rock = Tour.create(
           name: 'Red Rock Canyon Tour',
           amount: 6999,
           time: '5:00pm',
           location: 'Free pick-up and drop-off from your hotel',
           duration: '6 hours',
           description: 'While you\'re in Las Vegas, take a visit to Red Rock Canyon, one of the Mojave Desert\'s most beautiful attractions.  you will hear about past explorers and the canyon\'s unique geography and wildlife. Next, you\'ll take a smooth ride around the scenic loop.',
           highlights: 'Guided sightseeing tour of the Red Rock Canyon from Las Vegas, Leisurely 13-mile (21-kilometer) scenic loop, Calico Hills, Roasting pits and petroglyphs at Willow Springs',
           start_date: Date.today,
           wednesday: true, thursday: true
          )

valley_of_fire = Tour.create(
           name: 'Valley of Fire Tour',
           amount: 11499,
           time: '4:00pm',
           location: 'Free pick-up and drop-off from your hotel',
           duration: '4 hours',
           description: 'Journey back 3000 years in time and discover the Great Anasasi “Lost City.”  Experience authentic Pueblos, pottery, baskets, arrowheads, tools, mystical ancient Indian Petroglyphs and other priceless artifacts.  This tour of early Native American life is truly the Jewel of the American Southwest.  The incredible Valley of Fire was once the spiritual center of this great Early American Civilization.  The rock formations and Indian art will amaze you. You will be moved to your soul on this spiritual and wonder filled adventure.',
           highlights: ' Valley of Fire is an unforgettable stop yielding an abundance of well preserved Indian petroglyphs, Incredible display of botanical desert fauna.',
           start_date: Date.today,
           friday: true, saturday: true
          )

death_valley = Tour.create(
           name: 'Death Valley Tour',
           amount: 17999,
           time: '3:00pm',
           location: 'Free pick-up and drop-off from your hotel',
           duration: '4 hours',
           description: 'Filled with craters, abstract land formations, canyons, mountains and desert, Death Valley isn\'t considered "A Land of the Extremes" for nothing. With activities like hiking, biking, camping, or bird watching, you can reconnect with nature like you never have before. ',
           highlights: 'Scotty\'s Castle Area featuring an elaborate Spanish-style mansion of a local prospector, Stovepipe Wells Area filled with sand dunes and canyons',
           start_date: Date.today,
           saturday: true, sunday: true
          )



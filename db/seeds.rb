User.create(username: 'Armen', password: 'password')

shuttle = Shuttle.create(name: 'Shuttle', sunday: true, start_date: Date.today)
shuttle.amount = 1000
shuttle.round_trip_amount = 2000
shuttle.group_amount = 4000
shuttle.group_round_trip_amount = 8000
shuttle.save

shuttle.shuttle_cities.create(name: 'Las Vegas')
shuttle.shuttle_cities.create(name: 'Glendale')
shuttle.shuttle_cities.create(name: 'Hollywood')

shuttle.save #need save to compute legs after cities



tour = Tour.create(name: 'Tour', start_date: Date.today, sunday: true)


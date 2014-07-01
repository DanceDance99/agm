namespace :db do
  task :rebuilt_shuttles => :environment do
    Shuttle.all.update_all(shuttle_lag_rebuilt: false)

    future_days = 365

    date = Date.today
    names = flag_mapping["day_bits"]

    future_days.times do
      if self.day_bits & (2 ** (date.wday)) > 0
        self.shuttle_cities.each_cons(2) do |from, to|
          self.shuttle_legs.where(:date => date, :from => from, :to => to).first_or_create
        end

        self.shuttle_cities.reverse.each_cons(2) do |from, to|
          self.shuttle_legs.where(:date => date, :from => from, :to => to).first_or_create
        end
      else
        self.shuttle_cities.each_cons(2) do |from, to|
          present_shuttles = self.shuttle_legs.where(:date => date, :from => from, :to => to)
          present_shuttles.each do |shuttle|
            shuttle.destroy if shuttle && shuttle.available == 11
          end
        end

        self.shuttle_cities.reverse.each_cons(2) do |from, to|
          present_shuttles = self.shuttle_legs.where(:date => date, :from => from, :to => to)
          present_shuttles.each do |shuttle|
            shuttle.destroy if shuttle && shuttle.available == 11
          end
        end
      end

      date = date + 1
    end
  end

  task :rebuilt_tour => :environment do
    Tour.all.update_all(tour_date_rebuilt: false)

    future_days = 365

    date = Date.today
    names = flag_mapping["day_bits"]

    future_days.times do
      if self.day_bits & (2 ** (date.wday)) > 0   # find the bit for each weekday and check if it is flagged
        self.tour_dates.where(:date => date).first_or_create
      else
        present_tour = self.tour_dates.find_by_date(date)
        present_tour.destroy if present_tour && present_tour.available == 11
      end

      date = date + 1
    end
  end
end
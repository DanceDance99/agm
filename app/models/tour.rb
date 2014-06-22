class Tour < ActiveRecord::Base
  include FlagShihTzu #bitfield flags

  has_many :reservations
  has_many :tour_dates

  after_save :create_missing_tour_dates

  validates :amount, :presence => true

  has_flags 1 => :sunday,
            2 => :monday,
            3 => :tuesday,
            4 => :wednesday,
            5 => :thursday,
            6 => :friday,
            7 => :saturday,
            :column => "day_bits"



  def days
    #returns string like "Monday, Tuesday and Thursday"
    self.selected_day_bits.map(&:capitalize).to_sentence
  end


  private

  def create_missing_tour_dates
    #need to know maximum days into the future that can be booked
    future_days = 365

    date = Date.today
    names = flag_mapping["day_bits"]

    future_days.times do
      if self.day_bits & (2 ** (date.wday)) > 0   # find the bit for each weekday and check if it is flagged
        self.tour_dates.where(:date => date).first_or_create
      end

      date = date + 1
    end

  end
end

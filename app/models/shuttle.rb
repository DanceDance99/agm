class Shuttle < ActiveRecord::Base
  include FlagShihTzu #bitfield flags
  
  has_many :bookings
  
  has_many :shuttle_cities, -> { order('position asc') }
  has_many :shuttle_legs
  
  accepts_nested_attributes_for :shuttle_cities
  
  validates :amount, :presence => true
  validates :round_trip_amount, :presence => true
  validates :group_amount, :presence => true
  validates :group_round_trip_amount, :presence => true
        
  after_save :create_missing_shuttle_legs
  
  has_flags 1 => :sunday,
            2 => :monday,
            3 => :tuesday,
            4 => :wednesday,
            5 => :thursday,
            6 => :friday,
            7 => :saturday,
            :column => "day_bits"
  
  
  def dates_for_journey(from, to, passengers, date_range = Date.today..1.month.from_now)
    
    dates = self.shuttle_legs.where(:from_id => from, :date => date_range).where(["available >= ?",passengers]).map &:date
    current_city = to.position > from.position ? from.lower_item : from.higher_item
    
    #intersect the set of dates that match for each leg of the journey if there are multiple legs
    while( current_city && current_city != to )
      matches = self.shuttle_legs.where(:from_id => current_city, :date => date_range).where(["available >= ?",passengers]).map &:date
      dates = dates & matches
      current_city = to.position > from.position ? current_city.lower_item : current_city.higher_item

    end
    
    return [] if current_city != to
    
    dates
  end
  
  
  def days
    #returns string like "Monday, Tuesday and Thursday"
    self.selected_day_bits.map(&:capitalize).to_sentence
  end
  
  
  private
  
  def create_missing_shuttle_legs
    future_days = 31
    
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
      end
        
      date = date + 1
    end

  end
end

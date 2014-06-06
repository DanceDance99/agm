require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  
  test "reservation should be valid" do
    valid_attributes = {:passengers => 1, :tour => tours(:one)}
    
    reservation = Reservation.new(valid_attributes)
    assert reservation.valid?
  end
  
  test "reservation should decrement tour date" do
    reservation = reservations(:one)
    reservation.date = Date.today
    reservation.passengers = 1
    
    tour = tours(:one)
    tour_date = tour_dates(:one)
    tour_date.date = Date.today
    tour_date.available = 5
    tour.tour_dates << tour_date
    tour.save!
    reservation.tour = tour

    reservation.send :decrement_tour_date
    
    assert_equal 4, tour_date.reload.available
    
  end
  
end
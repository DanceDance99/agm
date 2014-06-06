require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  
  test "booking should be valid" do
    valid_attributes = {:shuttle => shuttles(:one), :to => shuttle_cities(:one), :from => shuttle_cities(:two), :depart_date => Date.today, :passengers => 1, :added_by_admin => true}
    
    booking = Booking.new(valid_attributes)
    assert booking.valid?
  end
  
  test "booking should compute correct amount for one way trip" do
    booking = Booking.new
    booking.passengers = 1
    booking.shuttle = shuttles(:one)
    booking.send( :compute_amount )
    assert_equal booking.amount, 1000
  end

  test "booking should compute correct amount for round trip" do
    booking = Booking.new
    booking.passengers = 1
    booking.shuttle = shuttles(:one)
    booking.round_trip = true
    booking.send( :compute_amount )
    assert_equal booking.amount, 2000
  end

  test "booking should compute correct amount for one way trip with pickup" do
    booking = Booking.new
    booking.passengers = 1
    booking.shuttle = shuttles(:one)
    booking.home_pickup = true
    booking.send( :compute_amount )
    assert_equal booking.amount, 2500
  end

  test "booking should compute correct amount for one way trip with dropoff and senior citizen" do
    booking = Booking.new
    booking.passengers = 1
    booking.shuttle = shuttles(:one)
    booking.home_dropoff = true
    booking.senior_citizen = true

    booking.send( :compute_amount )
    assert_equal booking.amount, 2000
  end

  test "booking should compute correct amount for one way trip with multiple passengers" do
    booking = Booking.new
    booking.passengers = 5
    booking.shuttle = shuttles(:one)

    booking.send( :compute_amount )
    assert_equal booking.amount, 5000
  end
  
  test "booking should compute correct amount for one way trip with private shuttle" do
    booking = Booking.new
    booking.passengers = 10000000 #clowns.
    booking.shuttle = shuttles(:one)
    booking.private_shuttle = true

    booking.send( :compute_amount )
    assert_equal booking.amount, 4000
  end

  test "booking should decrement shuttle legs" do
    booking = Booking.new
    booking.passengers = 4
    booking.shuttle = shuttles(:one)
    
    leg = ShuttleLeg.new(:available => 4)
    leg.expects(:decrement!).with(:available,4).returns(true)
    booking.stubs(:shuttle_legs_departing).returns([leg])
    booking.send( :decrement_shuttle_legs )    
  end

  test "booking should decrement shuttle legs for private shuttle" do
    booking = Booking.new
    booking.passengers = 4
    booking.shuttle = shuttles(:one)
    booking.private_shuttle = true
    
    leg = ShuttleLeg.new(:available => 4)
    booking.stubs(:shuttle_legs_departing).returns([leg])
    booking.send( :decrement_shuttle_legs )
    
    assert_equal leg.available, 0    
  end


  test "booking should compute shuttle legs departing" do
    
    date = Date.today
    booking = Booking.new
    booking.passengers = 4
    booking.from = shuttle_cities(:one)
    booking.to = shuttle_cities(:three)
    booking.depart_date = date
    shuttle = shuttles(:one)
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:two), :to => shuttle_cities(:three), :capacity => 3, :available => 3, :date => date)
    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    shuttle.shuttle_cities << shuttle_cities(:three)
    booking.shuttle = shuttle
    
    
    assert_equal shuttle.shuttle_legs.size, booking.send( :shuttle_legs_departing ).size
  end

  test "booking should compute shuttle legs returning" do
    
    date = Date.today
    booking = Booking.new
    booking.passengers = 4
    booking.from = shuttle_cities(:one)
    booking.to = shuttle_cities(:three)
    booking.return_date = date
    shuttle = shuttles(:one)
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:three), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:two), :to => shuttle_cities(:one), :capacity => 3, :available => 3, :date => date)
    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    shuttle.shuttle_cities << shuttle_cities(:three)
    booking.shuttle = shuttle
    
    assert_equal shuttle.shuttle_legs.size, booking.send( :shuttle_legs_returning ).size
  end

  
end

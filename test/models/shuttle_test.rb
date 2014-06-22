require 'test_helper'

class ShuttleTest < ActiveSupport::TestCase
  
  valid_attributes = {:amount => 0, :round_trip_amount => 0, :group_amount => 0, :group_round_trip_amount => 0}
  
  test "test shuttle saves" do
    shuttle = Shuttle.new(valid_attributes)
    assert shuttle.save
  end
  
  test "shuttle should create missing shuttle legs on save" do
    shuttle = Shuttle.create(valid_attributes.merge(:saturday => true))
    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    
    shuttle.save
    assert_equal shuttle.shuttle_legs.size, 2 *Date.today.upto(Date.today + 30).count { |date| date.saturday? }
  end
  
  test "shuttle should find valid date for journey" do
    date = Date.tomorrow
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)

    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)

    
    assert_equal shuttle.dates_for_journey(shuttle_cities(:one), shuttle_cities(:two), 3), [date]
  end
  
  test "should not find wrong date for journey" do
    date = 2.days.ago
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)

    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    
    assert_equal shuttle.dates_for_journey(shuttle_cities(:one), shuttle_cities(:two), 3), []
  end

  test "should not find full leg for journey" do
    date = Date.tomorrow
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 0, :date => date)

    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)

    assert_equal shuttle.dates_for_journey(shuttle_cities(:one), shuttle_cities(:two), 3), []
    
  end
  
  test "should not find wrong route for journey" do
    date = Date.tomorrow
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)

    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)

    assert_equal shuttle.dates_for_journey(shuttle_cities(:two), shuttle_cities(:one), 3), []
    
  end
  
  test "should find all legs of a journey" do
    date = Date.today
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save

    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:two), :to => shuttle_cities(:three), :capacity => 3, :available => 3, :date => date)


    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    shuttle.shuttle_cities << shuttle_cities(:three)


    assert_equal shuttle.dates_for_journey(shuttle_cities(:one), shuttle_cities(:three), 3), [date]
    
  end
  
  test "should not find a date for a partially booked leg" do
    date = Date.tomorrow
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save
        
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:two), :to => shuttle_cities(:three), :capacity => 3, :available => 2, :date => date)

    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    shuttle.shuttle_cities << shuttle_cities(:three)

    assert_equal shuttle.dates_for_journey(shuttle_cities(:one), shuttle_cities(:three), 3), []
    
  end
  
  test "should not find a date for a missing leg" do
    date = Date.tomorrow
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save
        
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:one), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)

    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    shuttle.shuttle_cities << shuttle_cities(:three)

    assert_equal shuttle.dates_for_journey(shuttle_cities(:one), shuttle_cities(:three), 3), []
    
  end
  
  test "should find a date for reverse route" do
    date = Date.tomorrow
    shuttle = Shuttle.create(valid_attributes)
    shuttle.save
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:three), :to => shuttle_cities(:two), :capacity => 3, :available => 3, :date => date)
    shuttle.shuttle_legs << ShuttleLeg.new(:from => shuttle_cities(:two), :to => shuttle_cities(:one), :capacity => 3, :available => 3, :date => date)

    shuttle.shuttle_cities << shuttle_cities(:one)
    shuttle.shuttle_cities << shuttle_cities(:two)
    shuttle.shuttle_cities << shuttle_cities(:three)

    assert_equal shuttle.dates_for_journey(shuttle_cities(:three), shuttle_cities(:one), 3), [date]
    
  end
  
  
  
end

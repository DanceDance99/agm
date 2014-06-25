require 'test_helper'

class TourTest < ActiveSupport::TestCase

  valid_attributes = {:amount => 0}
  
  test "tour should be valid" do
    tour = Tour.new(valid_attributes)
    assert tour.valid?
  end

  test "tour should display days" do
    tour = Tour.new(:monday => 1, :wednesday => 1)
    assert_equal tour.days, "Monday and Wednesday"
  end
  
  test "tour should create tour dates on save" do
    tour = Tour.new(valid_attributes.merge(:monday => 1))
    tour.save
    assert_not_equal tour.tour_dates.size, 0 
  end
  
  test "tour should create correct number of tour dates" do
    tour = Tour.new(valid_attributes.merge(:wednesday => 1, :friday => 1))
    tour.save
    
    assert_equal tour.tour_dates.size, Date.today.upto(Date.today + 30).count { |date| date.wednesday? || date.friday? }
  end
  
  
end

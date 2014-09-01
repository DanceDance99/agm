require 'test_helper'

class TourDateTest < ActiveSupport::TestCase
  
  test "tour date should save" do
    tour_date = TourDate.new(:tour => tours(:one), :date => Date.tomorrow)
    assert tour_date.save
  end
  
  
  test "tour date should display the date" do
    tour_date = TourDate.new(:date => Date.tomorrow)
    assert tour_date.human_date
  end
  
  
end

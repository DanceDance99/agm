class ShuttleLeg < ActiveRecord::Base
  belongs_to :shuttle
  belongs_to :from, :class_name => "ShuttleCity"
  belongs_to :to, :class_name => "ShuttleCity"

  default_value_for :capacity, 10
  default_value_for :available, 10
  
  
  def human_date
    self.date.to_formatted_s :human
  end
end

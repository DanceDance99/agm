class ShuttleCity < ActiveRecord::Base
  has_many :from_shuttle_legs, :foreign_key => 'from_id', :class_name => "ShuttleLeg"
  has_many :to_shuttle_legs, :foreign_key => 'to_id', :class_name => "ShuttleLeg"
  
  belongs_to :shuttle
  
  acts_as_list scope: :shuttle 
end

class TourDate < ActiveRecord::Base

  belongs_to :tour

  default_value_for :capacity, 11
  default_value_for :available, 11

  validates :tour_id, :presence => true
  validates :date, :presence => true

  def human_date
    self.date.to_formatted_s :human
  end
end

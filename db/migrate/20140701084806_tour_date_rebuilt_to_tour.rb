class TourDateRebuiltToTour < ActiveRecord::Migration
  def change
    add_column :tours, :tour_date_rebuilt, :boolean, default: true

    Tour.all.update_all(tour_date_rebuilt: true)
  end
end

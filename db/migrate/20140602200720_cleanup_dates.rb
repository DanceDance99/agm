class CleanupDates < ActiveRecord::Migration
  def change
    remove_column :tours, :days
    rename_column :tour_days, :day, :date
    rename_column :shuttle_legs, :day, :date
    
    rename_table :tour_days, :tour_dates
  end
end